class Unicorn

  attr_reader :name, :color
  def initialize(name, color = "white")
    @name = name
    @color = color
  end

  def white?
    return true if color == "white"
    false
    # if @color == "white"
    #   true
    # else
    #   false
    # end
  end

  def say(message)
    "**;* " + message + " **;*"
  end
end
