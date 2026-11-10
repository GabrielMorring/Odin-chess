# A generic chess piece, superclass for all the pieces
class Piece
  attr_reader :color

  def initialize(board, color = "white")
    @color = color
    @board = board
  end
end
