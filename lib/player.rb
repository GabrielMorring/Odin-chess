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
    new_spot = select_new_location

    @board.set(@board.at(piece_spot), new_spot)
    @board.set(nil, piece_spot)
  end

  def select_piece
    loop do
      selection = UI.get_coordinate

      return selection if @board.at(selection).class.superclass == Piece && @color == @board.at(selection).color

      puts "not one of your pieces"
    end
  end

  def select_new_location
    UI.get_coordinate
  end
end
