require "pry"
class Lifter

  @@all=[]

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self

  end

  def self.all
    @@all
  end

  def memberships
     Membership.all.select do |membership|
      membership.lifter == self
    end
  end
  ##returns an array of all gyms that lifter has memberships to
  def gyms
    memberships.map do |membership|

      membership.gym
    end
  end

  def self.average_lift
    total = 0
    @@all.each do |lifter|
      total += lifter.lift_total
    end
    total.to_f/@@all.length
  end

  ## creates a new Membership and associates a lifter and gym
    def sign_up(cost,gym)
      Membership.new(self,gym,cost)
    end
 ##returns a sum of the total cost of lifter's gym memberships
    def total_cost
  self_mem =  Membership.all.select do |membership|
        membership.lifter == self
    end
   cost = 0
    self_mem.each do |membership|
  
      cost += membership.cost
    end
  cost
  end
end
