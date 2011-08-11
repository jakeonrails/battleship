class Player

  attr_reader :board, :ships, :name

  def initialize(name, num_ships, board_size)
    self.name = name
    self.board = Board.new(board_size)
    self.ships = Array.new(num_ships)
  end

  def setup_board
    self.ships.map! do |ship|
      ship = Ship.new(1)
      begin
        ship.place(rand(board.width), rand(board.height), :horizontal)
        self.board.place_ship(ship)
      rescue
        retry
      end
     ship
    end
  end

  def attack(defender, x, y)
    defender.board.shoot(x, y)
  end

private
  attr_writer :name, :board, :ships

end

