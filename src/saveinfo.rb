require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary')

class Saveinfo
  include ActsAsBinary
  binary_data do
    skip 2
    name 25, :string
    skip 1
    year 2
    skip 4
    hour
    skip
    minute
    skip 3
  end
end
