class Medusa

  attr_reader :name, :statues
  def initialize(name)
    @name = name
    @statues = []
  end

  def stare(victim)
    self.add_statue(victim)
    victim.turn_to_stone
    if statues.length > 3
      statues[0].unstone
      self.remove_statue
    end
  end


  def add_statue(victim)
    @statues << victim
  end

  def remove_statue
    @statues.delete_at(0)
  end

end

class Person

  attr_reader :name, :stoned
  def initialize(name)
    @name = name
    @stoned = false
  end

  def stoned?
    stoned
  end

  def turn_to_stone
    @stoned = true
  end

  def unstone
    @stoned = false
  end

end
