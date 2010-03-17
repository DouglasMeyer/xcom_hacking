require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary.rb')

class Soldier
  include ActsAsBinary
  binary_data do
    rank 2 # also a good way to check for death
    location 2
    craft 2
    skip 2
    completed_missions 2
    kills 2
    wound_time 2
    skip 2
    name 25, :string
    transfer_destination
    time_units
    health
    stanima
    reaction
    strength
    fireing_accuracy
    throwing_accuracy
    melee_accuracy
    psionic_strength
    psionic_skill
    bravery
    time_units_increment
    health_increment
    stanima_increment
    reaction_increment
    strength_increment
    fireing_accuracy_increment
    throwing_accuracy_increment
    melee_accuracy_increment
    bravery_increment
    armour_type
    last_month_psi
    in_psi_training
    skip
    sex
    appearance
  end
end
