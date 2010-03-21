require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'src', 'loc')

class LocTest < Test::Unit::TestCase
  subject { Loc }

  context "Loc.binary_data" do
    should_have_binary :type_id, 0
    should_have_binary :x, 2
    should_have_binary :y, 4
  end

  context "Loc#exist?" do
    subject { Loc.new }
    should "be true when @type_id isn't 0" do
      subject.instance_variable_set('@type_id', 1)
      assert subject.exist?
    end
    should "be false when @type_id is 0" do
      subject.instance_variable_set('@type_id', 0)
      assert !subject.exist?
    end
  end
end
