require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'src', 'saveinfo')

class SaveinfoTest < Test::Unit::TestCase
  subject { Saveinfo }

  context "Saveinfo.binary_data" do
    should_have_binary :name, (2..26).to_a, :string
    should_have_binary :year, 28, 29
    should_have_binary :hour, 34
    should_have_binary :minute, 36
  end
end
