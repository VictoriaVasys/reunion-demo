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
    owers = []
    @activities.each do |activity|
      owers << activity.owed
    end
    owers.reduce do |memo, activity|
      memo.merge(activity)
    end
    # owes.reduce(&:merge)
  end
  
  def print_summary
    breakdown.each do |ower, money|
      p "#{ower}: #{money}"
    end
  end
  
end
