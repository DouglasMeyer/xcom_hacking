require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary')

class Loc
  include ActsAsBinary
  binary_data do
    type_id
      # 1 = ufo?
      # 3 = base
      # 2 = craft
      # 7 = way-point
    skip
    x
    skip
    y
    skip 15
  end

  def exist?
    @type_id != 0
  end
end
