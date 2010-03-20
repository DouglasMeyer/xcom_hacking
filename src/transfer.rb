require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary')

class Transfer
  include ActsAsBinary
  binary_data do
    skip 2
    hours
    skip
    item_id
      # 0 = Scientists, Engineers
      # 8 = Soldier?
      # 10 = Tank/Cannon
      # 93 = HWP Cannon Shells
      # 11 = Tank/Rocket Launcher
      # 94 = HWP Rockets
      # 21 = HC-HE Ammo
      # 22 = HC-I Ammo
      # 25 = AC-HE Ammo
      # 26 = AC-I Ammo
      # 29 = Large Rocket
      # 30 = Incendiary Rocket
      # 35 = Smoke Grenade
      # 36 = Proximity Grenade
      # 37 = High Explosive
      # 41 = Stun Rod
      # 42 = Electro-flare
    skip
    quantity
    skip
  end
end
