require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'src', 'craft')

class CraftTest < Test::Unit::TestCase
  subject { Craft }

  context "Craft.binary_data" do
    should_have_binary :type_id, 0
    should_have_binary :bay1_ammo, 2
    should_have_binary :bay2_ammo, 6
#NOTE: these are probably similar to base
    should_have_binary :pistol, 49
    should_have_binary :pistol_clip, 50
    should_have_binary :rifle, 51
    should_have_binary :rifle_clip, 52
    should_have_binary :heavy_cannon, 53
    should_have_binary :hc_ap_ammo, 54
    should_have_binary :hc_he_ammo, 55
    should_have_binary :grenade, 68
  end

  context "Craft.exist?" do
    subject { Craft.new }

    should "be false if @type_id is 255" do
      subject.instance_variable_set('@type_id', 255)
      assert !subject.exist?
    end
    should "be true if @type_id isn't 255" do
      subject.instance_variable_set('@type_id', 0)
      assert subject.exist?
    end
  end
end
