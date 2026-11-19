# The chess game loop
class ChessGame
  include UI

  def initialize
    @board = Board.new
    @players = [Player.new(@board, "white"), Player.new(@board, "black")]
    @current_player_id = 0
  end

  def play
    loop do
      puts "\n(s)ave, (q)uit or (c)ontinue"
      return if UI.get_user_input("s", "q", "c") == "q"

      puts ""

      display_board

      puts "#{current_player.color.capitalize}'s turn\n"

      current_player.make_move

      switch_player
    end
  end

  def current_player
    @players[@current_player_id]
  end

  def other_player
    @players[@current_player_id - 1]
  end

  def switch_player
    @current_player_id = @current_player_id.zero? ? 1 : 0
  end
end
