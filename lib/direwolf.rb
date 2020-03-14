class Direwolf

  attr_reader :name, :home, :size, :starks_to_protect
  def initialize(name, home = "Beyond the Wall", size = "Massive")
    @name = name
    @home = home
    @size = size
    @starks_to_protect = []
  end

  def protects(stark)
    return false unless self.eligible_to_protect?(stark)
    @starks_to_protect << stark
    stark.protected_status = :safe
  end

  def eligible_to_protect?(stark)
    return true if self.home == stark.location && starks_to_protect.length < 2
    false
  end

  def hunts_white_walkers?
    return false if starks_to_protect.length != 0
    true
  end

  def leaves(stark)
    return stark if starks_to_protect.include?(stark) == false
    stark.protected_status = :unsafe
    starks_to_protect.delete(stark)
  end

end

class Stark

  attr_reader :name, :location,  :house_words
  attr_accessor :protected_status
  def initialize(name, location = "Winterfell")
    @name = name
    @location = location
    @protected_status = :unsafe
    if name == "Arya"
      @house_words = "The North Remembers"
    else
      @house_words = "Winter is Coming"
    end
  end

  def safe?
    return true if protected_status == :safe
    false
  end
end
