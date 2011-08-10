class Ship

  attr_accessor :x, :y, :size
  attr_accessor :orientation

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

private

  attr_writer :player


end

