class Activity
  
  attr_reader :name, :participants
  
  def initialize(name)
    @name = name
    @participants = {}
  end
  
  def add_participant(person, amount_paid)
    @participants[person] = amount_paid
  end
  
  def total_cost
    participants.values.sum
  end
  
  def split
    total_cost / participants.keys.count
  end
  
  def owed
    participants.reduce({}) do |memo, participant|
      memo[participant.first] = split - participant.last
      memo
    end
  end
end
