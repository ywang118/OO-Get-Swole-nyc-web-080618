class Membership

  @@all = []
  attr_reader :cost, :lifter, :gym

  def initialize(lifter,gym,cost)
    @lifter = lifter
    @gym = gym
    @cost = cost
    @@all << self
  end

  def self.all
    @@all
  end  


end
