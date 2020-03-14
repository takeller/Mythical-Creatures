class Wizard

  attr_reader :name, :bearded, :spell_counter
  def initialize(name, bearded: true)
    @name = name
    @bearded = bearded
    @spell_counter = 0
  end

  def bearded?
    bearded
  end

  def incantation(runes)
    "sudo " + runes
  end

  def rested
    return false if spell_counter >= 3
    true
  end

  def rested?
    rested
  end

  def cast
    @spell_counter += 1
    "MAGIC MISSILE!"
  end
end
