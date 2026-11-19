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
    @grid = Array.new(8) { Array.new(8) }

    (0..7).each do |column|
      @grid[column][1] = Pawn.new(self)
      @grid[column][6] = Pawn.new(self, "black")
    end

    grid[0][0] = Rook.new(self)
    grid[7][0] = Rook.new(self)
    grid[1][0] = Knight.new(self)
    grid[6][0] = Knight.new(self)
    grid[2][0] = Bishop.new(self)
    grid[5][0] = Bishop.new(self)
    grid[3][0] = Queen.new(self)
    grid[4][0] = King.new(self)

    grid[0][7] = Rook.new(self, "black")
    grid[7][7] = Rook.new(self, "black")
    grid[1][7] = Knight.new(self, "black")
    grid[6][7] = Knight.new(self, "black")
    grid[2][7] = Bishop.new(self, "black")
    grid[5][7] = Bishop.new(self, "black")
    grid[3][7] = Queen.new(self, "black")
    grid[4][7] = King.new(self, "black")
  end

  # Takes two coordinates and returns that board location
  def at(*coordinates)
    @grid[coordinates.flatten[0]][coordinates.flatten[1]]
  end

  def set(value, *coordinates)
    @grid[coordinates.flatten[0]][coordinates.flatten[1]] = value
  end
end
