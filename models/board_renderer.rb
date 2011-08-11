class BoardRenderer
  SHIP      = '.'
  OPEN_SEA  = ' '
  HIT       = '*'
  SUNK      = 'X'
  MISS      = '!'
  LOCH_NESS = 'L'

  def initialize board
    @board = board
  end

  def defender_view
    render_board true
  end

  def attacker_view
    render_board false
  end

private

  def render_board show_ships = true
    render_header
    0.upto(@board.height - 1).each do |row|
      render_row(row, show_ships)
      render_row_separator
    end
    render_key
  end

  def render_header
    row_label_spacer = "#{' ' * (row_label_width + 1)}"
    border = "#{row_label_spacer}#{'-' * board_width}"
    puts border
    print "#{row_label_spacer}"
    (0..@board.width).each do |i|
      number = "%#{cell_width}d" % i
      print "#{number}|"
    end
    print "\n"
    puts border
  end

  def render_row row, show_ships
    print "%#{row_label_width}d" % row
    print "|"
    @board.cells[row].each do |cell|
      representation = case cell
      when Ship
        if show_ships
          SHIP
        else
          OPEN_SEA
        end
      when NilClass
        OPEN_SEA
      when :hit
        HIT
      when :sunk
        SUNK
      when :miss
        MISS
      else
        LOCH_NESS
      end
      print "%#{row_label_width}s" % representation
      print "|"
    end
    print "\n"
  end

  def render_key
    puts "Key: #{SHIP} = your ship  /  " \
         "#{HIT} = hit on a ship  / " \
         "#{SUNK} = sunken ship  / " \
         "#{MISS} = miss / " \
         "#{LOCH_NESS} = Loch Ness Monster"
  end

  def render_row_separator
    puts "-" * (row_label_width + 1 + board_width)
  end

  def cell_width
    @board.width.to_s.length
  end

  def row_label_width
    @board.height.to_s.length
  end

  def board_width
    @board.width * (cell_width + 1) + 1 + row_label_width
  end
end # class BoardRenderer
