class Ship

  attr_reader :x, :y

  def initialize(player, x, y)
    self.player = player
    self.x = x
    self.y = y
    self.orientation = orientation
    self.health = health
  end

  def vertical?
    self.orientation == "vertical"
  end

end

