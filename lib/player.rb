class Player
  attr_reader :color

  def initialize(board, color)
    @board = board
    @color = color
  end

  def make_move
    puts "\nSelect a piece on the board with coordinates\n"
    piece_spot = select_piece

    puts "\nSelect a new spot on the board with coordinates\n"
    new_spot = select_new_location(piece_spot)

    @board.set(@board.at(piece_spot), new_spot)
    @board.set(nil, piece_spot)
  end

  def select_piece
    loop do
      selection = UI.get_coordinate

      unless @board.at(selection).class.superclass == Piece && @color == @board.at(selection).color
        puts "not one of your pieces"
        next
      end

      unless @board.at(selection).can_move?(selection)
        puts "that piece can't move"
        next
      end

      return selection
    end
  end

  def select_new_location(start_location)
    loop do
      new_location = UI.get_coordinate

      return new_location if @board.at(start_location).valid_move?(start_location, new_location)

      puts "You can't go there"
    end
  end
end
