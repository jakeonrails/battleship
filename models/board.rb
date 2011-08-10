class Board
  attr_accessor :height, :width
  attr_reader :cells

  def initialize size
    self.height = size
    self.width = size
    initialize_cells
  end
  
private

  attr_writer :cells

  def initialize_cells
    self.cells = Array.new(height) do
      Array.new(width) { nil }
    end
  end
end # class Board
