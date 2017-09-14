class Reunion
  
  attr_reader :location, :activities
  
  def initialize(location)
    @location = location
    @activities = []
  end
  
  def add_activity(activity)
    @activities << activity
  end
  
  def total_cost
    @activities.map {|activity| activity.total_cost}.sum
  end
  
  def breakdown
    @activities.map do |activity|
      activity.owed
    end # this could be its own method; e.g. amount_owed_per_person_per_activity
    owers.reduce do |memo, activity|
      memo.merge(activity)
    end
    # owers.reduce(&:merge) # this could replace the above reduce block
  end
  
  def print_summary
    breakdown.each do |ower, money|
      p "#{ower}: #{money}"
    end
  end
  
end
