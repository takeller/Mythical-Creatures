class Direwolf

  attr_reader :name, :home, :size, :starks_to_protect, :eligible_to_protect
  def initialize(name, home = "Beyond the Wall", size = "Massive")
    @name = name
    @home = home
    @size = size
    @starks_to_protect = []
  end

  def protects(stark)
    return false unless eligible_to_protect?(stark)
    @starks_to_protect << stark
    stark.make_safe
  end

  def eligible_to_protect?(stark)
    home == stark.location && starks_to_protect.length < 2
  end

  def hunts_white_walkers?
    starks_to_protect.length == 0
  end

  def leaves(stark)
    return stark if starks_to_protect.include?(stark) == false
    stark.make_unsafe
    starks_to_protect.delete(stark)
  end

end

class Stark

  attr_reader :name, :location, :protected_status
  def initialize(name, location = "Winterfell")
    @name = name
    @location = location
    @protected_status = :unsafe
  end

  def house_words
    return "The North Remembers" if name == "Arya"
    "Winter is Coming"
  end

  def make_safe
    @protected_status = :safe
  end

  def make_unsafe
    @protected_status = :unsafe
  end

  def safe?
    protected_status == :safe
  end
end
