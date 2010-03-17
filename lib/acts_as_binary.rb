module ActsAsBinary
  def self.included(klass)
    klass.extend ClassMethods
  end
  module ClassMethods
    def binary_data(&block)
      if block_given?
        settings = BinarySettings.new
        settings.run(&block) if block_given?
        @binary_data, @data_offset = settings.data, settings.offset
      end
      @binary_data ||= {}
    end
    class BinarySettings
      attr_accessor :data, :offset
      def run(&block)
        instance_eval(&block)
      end
      def method_missing(name, *args)
        @data ||= {}
        @offset ||= 0
        size = args[0] || 1
        type = args[1] || :number
        @data[name] = (@offset..(@offset+size-1)).to_a
        @offset += size
      end
    end
    def load_data(data)
      1.upto(data.length / @data_offset).map do |offset|
        instance = self.new
        binary_data.each do |name, indexes|
          value = indexes.inject([0,0]){ |set, index|
            [ set[0]+data[index]*256**set[1], set[1]+1 ]
          }.first
          instance.instance_variable_set("@#{name}", value)
        end
        instance
      end
    end
  end
end
