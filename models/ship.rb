class Ship

  attr_accessor :x, :y, :size
  attr_accessor :orientation
  attr_reader :board
  attr_reader :health

  def initialize(board, x, y, size, orientation)
    self.board = board
    self.x = x
    self.y = y
    self.orientation = orientation
    self.size = size
    self.health = " " * size
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
  attr_writer :board, :health

end

