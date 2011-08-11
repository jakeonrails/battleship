class Ship

  attr_accessor :x, :y, :size
  attr_accessor :orientation
  attr_reader :board
  attr_reader :health

  def initialize(size)
    self.board = nil
    self.x = 0
    self.y = 0
    self.orientation = :horizontal
    self.size = size
    self.health = " " * size
    self.type = "Battleship"
  end

  def place x, y, orientation
    self.x = x
    self.y = y
    self.orientation = orientation
  end

  def vertical?
    self.orientation == :vertical
  end

  def alive?
    self.health.include?(" ")
  end

  def shoot(x, y)
    if (self.orientation == :vertical)
      index = y - self.y
      self.health[index] = 'x'
    else # horizontal
      index = x - self.x
      self.health[index] = "x"
    end
  end

private
  attr_writer :board, :health, :type

end

