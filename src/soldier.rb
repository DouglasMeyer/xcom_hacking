require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary.rb')

class Soldier
  include ActsAsBinary
  binary_data do
    rank 2 # also a good way to check for death
    location 2 #FIXME: rename to base_id; NOTE: is that valid?
    craft 2 #FIXME: rename to craft_id
    skip 2
    completed_missions 2 #FIXME: Validate
    kills 2 #TODO: Validate
    wound_time 2 #TODO: Validate
    skip 2
    name 25, :string
    transfer_destination #FIXME; rename to transfer_base_id; NOTE: is this valid?
    time_units
    health
    stanima
    reaction
    strength
    fireing_accuracy
    throwing_accuracy
    melee_accuracy #TODO: Validate
    psionic_strength #TODO: Validate
    psionic_skill #TODO: Validate
    bravery #FIXME: rename, NOTE: bravery = (BRAVERY - 11)*10
    time_units_increment #TODO: Validate
    health_increment #TODO: Validate
    stanima_increment #TODO: Validate
    reaction_increment #TODO: Validate
    strength_increment #TODO: Validate
    fireing_accuracy_increment #TODO: Validate
    throwing_accuracy_increment #TODO: Validate
    melee_accuracy_increment #TODO: Validate
    bravery_increment #TODO: Validate
    armour_type
    last_month_psi #TODO: Validate
    in_psi_training #TODO: Validate
    skip
    sex #NOTE: 0 = male, 1 = female
    appearance
  end

  def dead?
    @rank == 0xFFFF
  end
end
