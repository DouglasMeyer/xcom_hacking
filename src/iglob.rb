require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary')

class Iglob
  include ActsAsBinary
  binary_data do
    #NOTE: 5 may be day_of_the_week 0=sunday
    skip 12
    hour
    skip 3
    minute
    skip 43
  end
end
