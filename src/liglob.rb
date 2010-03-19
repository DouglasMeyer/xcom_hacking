require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary')

class Liglob
  include ActsAsBinary
  binary_data do
    funds 3
    skip 145 #TODO: I'm assuming there should only be one record
  end
end
