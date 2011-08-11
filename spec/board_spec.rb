require 'spec_helper'
require 'board'

describe Board do
  describe '#initialize' do
    it 'complains about negative board sizes' do
      expect do
        Board.new -1
      end.to raise_error(ArgumentError)
    end

    it 'complains about zero-sized boards' do
      expect do
        Board.new 0
      end.to raise_error(ArgumentError)
    end
  end

  describe '#height' do
    it 'returns the size specified at board initializtion time' do
      Board.new(10).height.should == 10
    end
  end

  describe '#width' do
    it 'returns the size specified at board initialization time' do
      Board.new(10).width.should == 10
    end
  end

  describe '#cells' do
    it 'returns an array of rows' do
      Board.new(3).cells.should == [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
      ]
    end
  end
end
