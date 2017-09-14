require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  
  def test_it_exists
    reunion = Reunion.new("Denver")
    
    assert_instance_of Reunion, reunion
  end
  
  def test_a_reunion_has_a_location
    reunion = Reunion.new("Denver")
    
    assert_equal "Denver", reunion.location
  end
  
  def test_a_reunion_is_initialized_with_empty_collection_of_activities
    reunion = Reunion.new("Denver")
    
    assert_equal [], reunion.activities
  end
  
  def test_add_activity_adds_to_activities_collection
    reunion = Reunion.new("Denver")
    activity = Activity.new("Brunch")
    reunion.add_activity(activity)

    assert_instance_of Activity, reunion.activities.first
    assert_equal 1, reunion.activities.count
    assert_equal "Brunch", reunion.activities.first.name
  end
  
  def test_total_cost_returns_cost_from_all_activities
    reunion = Reunion.new("Denver")
    activity = Activity.new("Brunch")
    activity2 = Activity.new("Water Slides")
    reunion.add_activity(activity)
    reunion.add_activity(activity2)
    activity.add_participant("Jim", 20)
    activity2.add_participant("Joe", 40)
    
    assert_equal 60, reunion.total_cost
  end
  
  def test_breakdown_returns_people_and_amount_owed_or_owed_to_them
    reunion = Reunion.new("Denver")
    activity = Activity.new("Brunch")
    activity2 = Activity.new("Water Slides")
    reunion.add_activity(activity)
    reunion.add_activity(activity2)
    activity.add_participant("Jim", 20)
    activity.add_participant("Tom", 40)
    activity2.add_participant("Joe", 40)
    activity2.add_participant("Sarah", 80)
    
    assert_equal({"Jim" => 10, "Tom" => -10, "Joe" => 20, "Sarah" => -20}, reunion.breakdown)
  end
  
  def test_print_summary
    reunion = Reunion.new("Denver")
    activity = Activity.new("Brunch")
    activity2 = Activity.new("Water Slides")
    reunion.add_activity(activity)
    reunion.add_activity(activity2)
    activity.add_participant("Jim", 20)
    activity.add_participant("Tom", 40)
    activity2.add_participant("Joe", 40)
    activity2.add_participant("Sarah", 80)
    
    assert_equal("Jim: 10, Tom: -10, Joe: 20, Sarah: -20", reunion.print_summary)
  end
  
  
end
