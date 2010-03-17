require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary')

class ActsAsBinaryTest < Test::Unit::TestCase

  context "Class.binary_data block" do
    setup do
      @class = Class.new do
        include ActsAsBinary
        binary_data do
          name 10
          sex
        end
      end
    end

    should "set binary data" do
      binary_data = []
      10.times do |index|
        binary_data[index]  = { :name => :name, :index => index, :type => :number }
      end
      binary_data[10] = { :name => :sex, :index => 0, :type => :number }
      assert_equal binary_data, @class.binary_data
    end
  end

  context "instance.binary_data=" do
    subject do
      @class = Class.new do
        include ActsAsBinary
        binary_data do
          rank 2
          skip
          name 10, :string
          skip 4
          sex
        end
      end
      @class.new.tap do |instance|
        instance.data = [ 1,2, 3, (97..106).to_a, 4,5,6,7, 1 ].flatten
      end
    end

    should "set instance varibles on instance" do
      assert_equal 1+2*256,      subject.instance_eval{ @rank }
      assert_equal "abcdefghij", subject.instance_eval{ @name }
      assert_equal 1,            subject.instance_eval{ @sex  }
    end

    should "keep track of skips" do
      data = {}
      data[ 2] = 3
      data[13] = 4
      data[14] = 5
      data[15] = 6
      data[16] = 7
      assert_equal data, subject.instance_eval{ @skips }
    end
  end

  context "Class.load_file(file_name)" do
    subject do
      @class = Class.new do
        include ActsAsBinary
        binary_data do
          rank 2
          skip
          name 10, :string
          skip 4
          sex
        end
      end
      file_name = File.join(File.dirname(__FILE__), '..', 'tmp', 'aabt.dat')
      File.open(file_name, 'wb') do |file|
        data  = [ 1,2, 3, ('a'..'j').to_a, 4,5,6,7, 1 ].flatten
        data += [ 2,3, 4, ('f'..'o').to_a, 5,6,7,8, 0 ].flatten
        data.map!{|e| e.respond_to?('chr') ? e.chr : e }
        data.each{|d| file << d }
      end
      @class.load_file file_name
    end

    should "return an array of Class instances" do
      assert_equal 2, subject.length
      assert subject.all?{|i| i.is_a? @class }
    end

    should "assign data to instances" do
      instance1, instance2 = subject
      assert_equal 1+2*256,      instance1.instance_eval{ @rank }
      assert_equal "abcdefghij", instance1.instance_eval{ @name }
      assert_equal 1,            instance1.instance_eval{ @sex  }

      assert_equal 2+3*256,      instance2.instance_eval{ @rank }
      assert_equal "fghijklmno", instance2.instance_eval{ @name }
      assert_equal 0,            instance2.instance_eval{ @sex  }
    end
  end

end
