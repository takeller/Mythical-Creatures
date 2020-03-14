class Werewolf

  attr_reader :name, :location, :form, :hungry
  def initialize(name, location = nil)
    @name = name
    @location = location
    @form = "human"
    @hungry = false
  end

  def human?
    return true if form == "human"
    false
  end

  def wolf?
    return true if form == "werewolf"
    false
  end

  def hungry?
    hungry
  end

  def change!
    if form == "human"
      @form = "werewolf"
      @hungry = true
    else
      @form = "human"
    end
  end

  def consume_victim(victim)
    return if self.human? == true
    @hungry = false
    victim.status = :dead
  end


end
