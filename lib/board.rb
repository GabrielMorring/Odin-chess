require_relative "pieces/bishop"
require_relative "pieces/king"
require_relative "pieces/knight"
require_relative "pieces/pawn"
require_relative "pieces/queen"
require_relative "pieces/rook"

# The chess board
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8, Array.new(8))
  end
end
