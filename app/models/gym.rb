class Gym
 ALL = []

  attr_reader :name

  def initialize(name)
    @name = name
    ALL << self

  end

  def self.all
    ALL
  end

##returns an array of all of that gym's memberships
  def memberships
    Membership.all.select do |membership|
      membership.gym == self
    end
  end
##\ returns and array of all of that gym's lifters
  def lifters
    member = Membership.all.select do |membership|
      membership.gym == self
    end
    member.map do |membership|
      membership.lifter
    end
  end

 def lifter_names
## returns an array of all the names of that gym's lifters
  self.lifters.map do |lifter|
    lifter.name
  end

 end

##  returns a sum of lift_totals for all the lifters at that gym
  def  lift_total_for_gym
    total = 0
    self.lifters.each do |lifter|
      total += lifter.lift_total
    end
   total
  end



end
