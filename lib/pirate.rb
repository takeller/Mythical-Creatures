class Pirate

  attr_reader :name, :job, :heinous_acts_commited, :booty
  def initialize(name, job = "Scallywag")
    @name = name
    @job = job
    @heinous_acts_commited = 0
    @booty = 0
  end

  def commit_heinous_act
    @heinous_acts_commited += 1
  end

  def cursed?
    return true if heinous_acts_commited >= 3
    false
  end

  def rob_ship
    self.commit_heinous_act
    @booty += 100
  end
end
