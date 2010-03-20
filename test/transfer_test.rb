require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'src', 'transfer')

class TransferTest < Test::Unit::TestCase
  subject { Transfer }

  context "Transfer.binary_data" do
    should_have_binary :hours, 2
    should_have_binary :item_id, 4
    should_have_binary :quantity, 6
  end

  context "Transfer.exist?" do
    subject { Transfer.new }

    should "be true if @quantity isn't 0" do
      subject.instance_variable_set('@quantity', 6)
      assert subject.exist?
    end
    should "be false if @quantity is 0" do
      subject.instance_variable_set('@quantity', 0)
      assert !subject.exist?
    end
  end
end
