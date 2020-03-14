class Centaur

  attr_reader :name, :breed, :mood, :position, :activity_counter, :status
  def initialize(name, breed)
    @name = name
    @breed = breed
    @mood = "rested"
    @position = "standing"
    @activity_counter = 0
    @status = "healthy"
  end

  def shoot
    return "NO!" if self.cranky? == true || self.standing? == false
    @activity_counter += 1
    become_cranky
    "Twang!!!"
  end

  def run
    return "NO!" if self.cranky? == true || self.standing? == false
    @activity_counter += 1
    become_cranky
    "Clop clop clop clop!!!"
  end

  def drink_potion
    return "NO!" if self.laying? == true
    @mood = "rested"
    if self.rested? == true
      @status = "sick"
    end 
  end

  def become_cranky
    if activity_counter >= 3
      @mood = "cranky"
    end
  end

  def cranky?
    return true if mood == "cranky"
    false
  end

  def standing?
    return false if position != "standing"
    true
  end

  def sleep
    return "NO!" if self.standing? == true
    @mood = "rested"
    @activity_counter = 0
  end

  def lay_down
    @position = "laying"
  end

  def stand_up
    @position = "standing"
  end

  def laying?
    return true if position == "laying"
    false
  end

  def rested?
    return true if mood == "rested"
    false
  end


end
