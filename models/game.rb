models = File.expand_path('../models', File.dirname(__FILE__))
$LOAD_PATH.unshift models

require 'player.rb'
require 'board.rb'
require 'ship.rb'
require 'board_renderer.rb'

class Game

  attr_accessor :players

  def initialize()
    @players = []
    @jake = Player.new("jake", 3, 10)
    @greg = Player.new("greg", 3, 10)
    @players << @jake
    @players << @greg
    @current = 0
  end

  def setup_boards()
    @players.each do |player|
      player.setup_board
    end
  end

  def take_turns
    attacker = @jake
    defender = @greg
    display_outcome(take_turn(attacker, defender), attacker, defender)
    attacker = @greg
    defender = @jake
    display_outcome(take_turn(attacker, defender), attacker, defender)
  end

  def display_outcome(outcome, attacker, defender)
    case outcome
    when :hit
      puts "#{attacker.name}, you've hit one of #{defender.name}'s ships!"
    when :won
      puts "Congratulations, #{attacker.name}, you've won!"
      exit
    when :sunk
      puts "Congratulations, #{attacker.name}, you've sunken a battleship!"
    when :miss
      puts "Sorry, #{attacker.name}, you've missed all of #{defender.name}'s ships!"
    end
    puts "Here's the board state now: "
    puts "#{attacker.name}'s Board: "
    BoardRenderer.new(attacker.board).defender_view

    puts "#{defender.name}'s Board: "
    BoardRenderer.new(defender.board).attacker_view
  end

  def take_turn(attacker, defender)
    puts "#{attacker.name}, what column do you wish to attack?"
    x = get_numeric_input
    puts "#{attacker.name}, what row do you wish to attack?"
    y = get_numeric_input
    attacker.attack(defender, y, x)
    rescue StandardError => e
      puts e.inspect
      retry
  end

  def get_numeric_input
    x = gets.chomp
    raise ArgumentError, "You must enter a number!" if x.to_i.to_s != x
    x.to_i
  end

  def someone_has_won?
  end

  def other_player
  end

  def current_player
  end

  def play()
    setup_boards
    until (someone_has_won?)
      take_turns
    end
    announce_winner
  end

end

Game.new.play()

