require "spec_helper.rb"

require "ship"
require "board"

describe Ship do

  before :each do
    @board = Board.new(10)
  end

  describe "#shoot" do
    it "should set health when hit" do
      @ship = Ship.new(5)
      @ship.place(5, 5, :vertical)
      @ship.shoot(5, 5)
      @ship.health.should == "x    "
      @ship.shoot(5, 0)
      @ship.health.should == "x    "
      @ship.shoot(5, 6)
      @ship.health.should == "xx   "

      @ship = Ship.new(5)
      @ship.place(5, 5, :horizontal)
      @ship.shoot(5, 5)
      @ship.health.should == "x    "
      @ship.shoot(0, 0)
      @ship.health.should == "x    "
      @ship.shoot(5, 0)
      @ship.health.should == "x    "
      @ship.shoot(6, 5)
      @ship.health.should == "xx   "
    end
  end

  describe "#alive?" do
    it "should return false when ship is dead" do
      @ship = Ship.new(1)
      @ship.place(0, 0, :vertical)
      @ship.alive?.should == true
      @ship.shoot(0, 0)
      @ship.alive?.should == false
    end
  end

end

