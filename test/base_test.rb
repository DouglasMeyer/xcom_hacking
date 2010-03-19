require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'src', 'base')

class BaseTest < Test::Unit::TestCase
  subject { Base }

  context "Base.binary_data" do
    should_have_binary :name, (0..12).to_a, :string
    should_have_binary :facilitie_ids, (22..57).to_a, :array
    should_have_binary :stingray_launcher, 96, 97
    should_have_binary :avalanche_launcher, 98, 99
    should_have_binary :cannon, 100, 101
    should_have_binary :stingray_missile, 108, 109
    should_have_binary :avalanche_missile, 110, 111
    should_have_binary :cannon_rounds, 112, 113
    should_have_binary :pistol, 126, 127
    should_have_binary :pistol_clip, 128, 129
    should_have_binary :rifle, 130, 131
    should_have_binary :rifle_clip, 132, 133
    should_have_binary :heavy_cannon, 134, 135
    should_have_binary :hc_ap_ammo, 136, 137
    should_have_binary :auto_cannon, 142, 143
    should_have_binary :ac_ap_ammo, 144, 145
    should_have_binary :rocket_launcher, 150, 151
    should_have_binary :small_rocket, 152, 153
    should_have_binary :grenade, 164, 165
    should_have_binary :smoke_grenade, 166, 167
  end

end
