require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'src', 'liglob')

class LiglobTest < Test::Unit::TestCase
  subject { Liglob }

  context "Liglob.binary_data" do
    should_have_binary :funds, 0,1,2
  end
end
