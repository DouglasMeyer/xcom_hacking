require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'src', 'iglob')

class IglobTest < Test::Unit::TestCase
  subject { Iglob }

  context "Iglob.binary_data" do
    #NOTE: 5 may be day_of_the_week 0=sunday
    should_have_binary :hour, 12
    should_have_binary :minute, 16
  end
end
