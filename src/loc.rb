require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary')

class Loc
  include ActsAsBinary
  binary_data do
    type_id
    skip 19
  end

  def exist?
    @type_id != 0
  end
end
