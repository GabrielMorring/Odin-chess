# The main menu
class MainMenu
  include UI

  def start
    loop do
      display_menu
      selection = UI.get_user_input(1, 2, 3, 4)

      case selection.to_i
      when 1 then ChessGame.new.play
      when 2 then FEN.saved_games
      when 3 then custom_game
      when 4 then return
      end
    end
  end

  def custom_game
    display_custom_game_prompt

    fen = gets.chomp.strip

    FEN.game_from_fen(fen)
  end
end
