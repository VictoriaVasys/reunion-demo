require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  
  def test_it_exists
    activity = Activity.new("Brunch")
    
    assert_instance_of Activity, activity
  end
  
  def test_it_has_a_name
    activity = Activity.new("Brunch")
    
    assert_equal "Brunch", activity.name
    assert_instance_of Hash, activity.participants
    assert activity.participants.empty?
  end
  
  def test_add_participant_adds_person_and_cost_to_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    
    assert_equal({"Jim" => 20}, activity.participants)
    assert_equal 20, activity.total_cost
  end
  
  def test_participants_grows_with_each_add_participant
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    
    assert_equal({"Jim" => 20, "Joe" => 40}, activity.participants)
  end
  
  def test_total_cost_increases_with_two_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    
    assert_equal 60, activity.total_cost
  end
  
  def test_split_returns_total_cost_divided_by_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    
    assert_equal 30, activity.split
  end
  
  def test_owed_returns_the_person_and_how_much_they_owe
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    
    assert_equal({"Jim" => 10, "Joe" => -10}, activity.owed)
  end
  
end
