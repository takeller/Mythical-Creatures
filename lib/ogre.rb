class Ogre

  attr_reader :name, :home, :swings
  attr_accessor :encounter_counter
  def initialize(name, home = "Swamp")
    @name = name
    @home = home
    @swings = 0
    @encounter_counter = 0
  end

  def encounter(human)
    human.encounter_counter += 1
    self.encounter_counter += 1
    if human.notices_ogre? == true
      self.swing_at(human)
    end
  end

  def swing_at(human)
    @swings += 1
    if self.swings % 2 == 0
      human.status = :knocked_out
    end
  end

  def apologize(human)
    human.status = :healthy
  end 

end

class Human

  attr_reader :name
  attr_accessor :encounter_counter, :status
  def initialize()
    @name = "Jane"
    @encounter_counter = 0
    @status = :healthy
  end

  def notices_ogre?
    return true if encounter_counter % 3 == 0
    false
  end

  def knocked_out?
    return true if @status == :knocked_out
    false
  end
end
