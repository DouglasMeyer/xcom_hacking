require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'src', 'transfer')

class TransferTest < Test::Unit::TestCase
  subject { Transfer }

  context "Transfer.binary_data" do
    should_have_binary :hours, 2
    should_have_binary :item_id, 4
    should_have_binary :quantity, 6
  end
end
