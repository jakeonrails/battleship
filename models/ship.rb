class Ship

  attr_reader :x, :y

  def initialize(player, x, y, size)
    self.player = player
    self.x = x
    self.y = y
    self.orientation = orientation
    self.health = health
    self.size = size
  end

  def vertical?
    self.orientation == "vertical"
  end

end

