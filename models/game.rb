class Game

  attr_accessor :players

  def initialize()
    @players = []
    @players << Player.new("jake")
    @players << Player.new("greg")
  end

  def setup_boards()
    @players.each do |player|
      player.setup_board
    end
  end

  def play_turn
    @players.each do |player|
      player.take_turn
    end
  end

  def check_for_victory()
  end

  def check_for_hit()

    hit but no win
    hit with victory
    sunk a ship
    out of bounds
    second attempt
    missed
  end

  def play()
    do
      play_turn
    until (check_for_victory())
  end

end

Game.new.play()

