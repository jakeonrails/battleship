class Board
  attr_accessor :height, :width
  attr_reader :cells

  class CellOccupied < ArgumentError; end
  class CellOutOfBounds < ArgumentError; end
  class DuplicateShot < ArgumentError; end

  def initialize size
    if !size.is_a?(Fixnum) || size <= 0
      raise ArgumentError, "invalid size #{size}"
    end
    self.height = size
    self.width = size
    initialize_cells
  end

  # Place the ship on the board.
  def place_ship ship
    if ship.vertical?
      x_delta, y_delta = 1, 0 # traverse vertically
    else
      x_delta, y_delta = 0, 1 # traverse horizontally
    end

    x, y = ship.x, ship.y
    ship.size.times do
      if get_cell x, y
        raise CellOccupied, "cannot place ship at #{x}, #{y}"
      end
      x += x_delta
      y += y_delta
    end

    x, y = ship.x, ship.y
    ship.size.times do
      set_cell x, y, ship
      x += x_delta
      y += y_delta
    end
  end

  def shoot x, y
    ship = get_cell x, y
    unless ship.nil?
      raise DuplicateShot, "cell #{x}, #{y} has already been shot"
    end

    ship.shoot(x, y) # let the ship know that it's been hit
    set_cell(x, y, ship.alive? ? :hit : :sunk)
  end

private

  attr_writer :cells

  def initialize_cells
    self.cells = Array.new(height) do
      Array.new(width) { nil }
    end
  end

  # Gets the value currently stored at x, y
  #
  # Returns either:
  #   - nil for empty cells
  #   - :hit for hit ships
  #   - :miss for missed ships
  #   - a ship instance (for unhit ships)
  def get_cell x, y
    unless valid_cell?(x, y)
      raise CellOutOfBounds, "cell out of bounds at #{x}, #{x}"
    end

    cells[x][y]
  end

  # Stores the specified value at x, y
  #
  # See Board#get_cell for valid possible values.
  def set_cell x, y, value
    unless valid_cell?(x, y)
      raise CellOutOfBounds, "cell out of bounds at #{x}, #{x}"
    end

    cells[x][y] = value
  end

  # Returns true if the specified x, y coordinates fall
  # within the board.
  def valid_cell? x, y
    x > 0 && x < width && y > 0 && y < height
  end
end # class Board
