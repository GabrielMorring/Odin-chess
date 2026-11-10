# The chess game loop
class ChessGame
  include UI

  def initialize
    @board = Board.new
    # @player1 = Player("white")
    # @player2 = Player("black")
  end

  def play
    print @board.grid
    # display_board
  end
end
