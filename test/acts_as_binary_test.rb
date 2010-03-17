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
      binary_data = {
        :name => (0..9).to_a,
        :sex => [10]
      }
      assert_equal binary_data, @class.binary_data
    end
  end

  context "Class.load_data" do
    subject do
      @class = Class.new do
        include ActsAsBinary
        binary_data do
          rank 2
          name 10, :string
          sex
        end
      end
      data = [ 1,2, (97..106).to_a, 0,
               3,4, (106..115).to_a, 1 ].flatten
      @class.load_data data
    end

    should "create instances of the class" do
      assert subject.first.instance_of? @class
    end

    should "set instance varibles on instance" do
      instance1, instance2 = subject
      assert_equal 1+2*256, instance1.instance_eval{ @rank }
      assert_equal "hello", instance1.instance_eval{ @name }
      assert_equal 0,       instance1.instance_eval{ @sex  }

      assert_equal 3+4*256, instance2.instance_eval{ @rank }
      assert_equal "hello", instance2.instance_eval{ @name }
      assert_equal 1,       instance2.instance_eval{ @sex  }
    end
  end

end
