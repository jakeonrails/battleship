class Player

  attr_reader :board, :ships

  def initialize(game, num_ships)
    self.board = Board.new
    self.ships = Array.new(num_ships)
  end

  def place_ships
    self.ships.map! do |ship|
      ship = Ship.new
      do
        success = randomly_place_ship(ship)
      until success
      ship
    end
  end

  def randomly_place_ship(ship)
    begin
      ship.x = rand(board.width)
      ship.y = rand(board.height)
      ship.orientation = "vertical"
      self.board.place_ship(ship)
    rescue
      return false
    end
    true
  end

end

