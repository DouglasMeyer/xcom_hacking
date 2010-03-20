require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary')

class Purchase
  include ActsAsBinary
  binary_data do
    skip 20
  end
end
