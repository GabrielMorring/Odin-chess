class MainMenu
  include UI

  def start
    loop do
      display_menu
      selection = UI.get_user_input(1, 2, 3, 4)

      case selection.to_i
      when 1 then puts "hi"
      when 2 then FEN.saved_games
      when 3 then puts "yo"
      when 4 then return
      end
    end
  end
end
