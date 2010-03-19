require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary')

class Base
  include ActsAsBinary
  binary_data do
    name 13, :string
    skip 9
    facilitie_ids 36, :array
      # 0 = Access Lift
      # 1 = Living Quarters
      # 2 = Labratory
      # 3 = Workshop
      # 4 = Small Radar
      # 7 = General Stores
      # [[16,17],[18,19]] = Hanger
    skip 38
    stingray_launcher 2
    avalanche_launcher 2
    cannon 2
    skip 6
    stingray_missile 2
    avalanche_missile 2
    cannon_rounds 2
    skip 12
    pistol 2
    pistol_clip 2
    rifle 2
    rifle_clip 2
    heavy_cannon 2
    hc_ap_ammo 2
    skip 4
    auto_cannon 2
    ac_ap_ammo 2
    skip 4
    rocket_launcher 2
    small_rocket 2
    skip 10
    grenade 2
    smoke_grenade 2
    skip 124
  end
end
