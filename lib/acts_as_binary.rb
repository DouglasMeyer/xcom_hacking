module ActsAsBinary
  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    def binary_data(&block)
      if block_given?
        settings = BinarySettings.new(&block)
        @binary_data, @data_offset = settings.data, settings.offset
      end
      @binary_data ||= []
    end
    class BinarySettings
      attr_accessor :data, :offset
      def initialize(&block)
        instance_eval(&block)
      end
      def skip(size=1)
        @offset += size
      end
      def method_missing(name, *args)
        @data ||= []
        @offset ||= 0
        size = args[0] || 1
        size.times do |index|
          @data[@offset+index] = {
            :name => name,
            :index => index,
            :type => args[1] || :number
          }
        end
        @offset += size
      end
    end
    def load_file(file_name)
      instances = []
      File.open(file_name, 'rb') do |file|
        until file.eof?
          data = @data_offset.times.map{ file.readbyte }
          instances << new.tap{|i| i.data = data }
        end
      end
      instances
    end
  end

  def data=(new_data)
    new_data.each_with_index do |data, index|
      attributes = self.class.binary_data[index] ||
        { :name => :skips, :index => index, :type => :skip }
      instance_variable = "@#{attributes[:name]}"
      case attributes[:type]
      when :skip
        value = instance_variable_get(instance_variable) || {}
        value[index] = data
      when :string
        value = instance_variable_get(instance_variable) || ''
        value += data.chr
      else # :number
        value = instance_variable_get(instance_variable) || 0
        value += data*256**attributes[:index]
      end
      instance_variable_set("@#{attributes[:name]}", value)
    end
  end

end
