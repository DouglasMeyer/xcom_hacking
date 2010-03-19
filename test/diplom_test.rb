require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'src', 'diplom')

class DiplomTest < Test::Unit::TestCase
  subject { Diplom }

  context "Diplom.binary_data" do
    should_have_binary :country_code, 0
    should_have_binary :funding, 4, 5
    should_have_binary :previous_funding, 26, 27
  end
end
