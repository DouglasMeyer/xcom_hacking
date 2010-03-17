require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'src', 'soldier')

class SoldierTest < Test::Unit::TestCase
  subject { Soldier }

  context "Soldier.binary_data" do
    should_have_binary :rank, 0,1 # number => method
    should_have_binary :location, 2,3 # number
    should_have_binary :craft, 4,5 # number
    should_have_binary :completed_missions, 8,9 # number
    should_have_binary :kills, 10,11 # number
    should_have_binary :wound_time, 12,13 # number
#NOTE: don't set past 36, it will mess-up the display
    should_have_binary :name, (16..40).to_a # string
## Transfer destination for existing soldiers, not new ones
    should_have_binary :transfer_destination, 41 # number
    should_have_binary :time_units, 42 # number
    should_have_binary :health, 43 # number
    should_have_binary :stanima, 44 # number
    should_have_binary :reaction, 45 # number
    should_have_binary :strength, 46 # number
    should_have_binary :fireing_accuracy, 47 # number
    should_have_binary :throwing_accuracy, 48 # number
    should_have_binary :melee_accuracy, 49 # number
    should_have_binary :psionic_strength, 50 # number
    should_have_binary :psionic_skill, 51 # number
    should_have_binary :bravery, 52 # number => method
    should_have_binary :time_units_increment, 53 # number
    should_have_binary :health_increment, 54 # number
    should_have_binary :stanima_increment, 55 # number
    should_have_binary :reaction_increment, 56 # number
    should_have_binary :strength_increment, 57 # number
    should_have_binary :fireing_accuracy_increment, 58 # number
    should_have_binary :throwing_accuracy_increment, 59 # number
    should_have_binary :melee_accuracy_increment, 60 # number
    should_have_binary :bravery_increment, 61 # number
    should_have_binary :armour_type, 62 # number => method
    should_have_binary :last_month_psi, 63 # number
    should_have_binary :in_psi_training, 64 # number
#    should_have_binary :got_promoted, 65 # number
    should_have_binary :sex, 66 # number
    should_have_binary :appearance, 67 # number => method
  end

end
