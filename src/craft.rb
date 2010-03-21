require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary')

class Craft
  include ActsAsBinary
  binary_data do
    type_id
      # 1 => SKYRANGER-1
      # 3 => INTERCEPTOR-1
    skip
    bay1_ammo
    skip 3
    bay2_ammo
    skip 17
    fuel
    skip 24
    pistol
    pistol_clip
    rifle
    rifle_clip
    heavy_cannon
    hc_ap_ammo
    hc_he_ammo
    skip 12
    grenade
    skip 35
  end

  def exist?
    @type_id != 255
  end

end
