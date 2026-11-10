# All the methods that deal with displaying images and getting input from the terminal live here

module UI
  # Gets input from the user and validates it for you.
  # The valid_inputs parameter is a list af all the inputs you will accept.
  def self.get_user_input(*valid_inputs)
    loop do
      input = gets.chomp.strip.to_s
      return input if valid_inputs.flatten.any? { |x| x.to_s == input }

      puts "Invalid input"
    end
  end

  def display_menu
    puts <<~HEREDOC

      ▐▀▀▀▀▀▀▀▀▀▀▌▐▀▀▌      ▐▀▀▌▐▀▀▀▀▀▀▀▀▀▀▌▐▀▀▀▀▀▀▀▀▀▀▀▀▌▐▀▀▀▀▀▀▀▀▀▀▀▀▌
      ▐  ▄▄▄▄▄▄▄▄▌▐  ▌      ▐  ▌▐  ▄▄▄▄▄▄▄▄▌▐  ▄▄▄▄▄▄▄▄▄▄▌▐  ▄▄▄▄▄▄▄▄▄▄▌
      ▐  ▌        ▐  ▌      ▐  ▌▐  ▌        ▐  ▌          ▐  ▌
      ▐  ▌        ▐  ▀▀▀▀▀▀▀▀  ▌▐  ▀▀▀█     ▐  ▀▀▀▀▀▀▀▀▀▀▌▐  ▀▀▀▀▀▀▀▀▀▀▌
      ▐  ▌        ▐  ▄▄▄▄▄▄▄▄  ▌▐  █▀▀▀      ▀▀▀▀▀▀▀▀▀█  ▌ ▀▀▀▀▀▀▀▀▀█  ▌
      ▐  ▀▀▀▀▀▀▀▀▌▐  ▌      ▐  ▌▐  ▀▀▀▀▀▀▀▀▌▐▀▀▀▀▀▀▀▀▀▀  ▌▐▀▀▀▀▀▀▀▀▀▀  ▌
      ▐▄▄▄▄▄▄▄▄▄▄▌▐▄▄▌      ▐▄▄▌▐▄▄▄▄▄▄▄▄▄▄▌▐▄▄▄▄▄▄▄▄▄▄▄▄▌▐▄▄▄▄▄▄▄▄▄▄▄▄▌

        1 - New Game
        2 - Saved Games
        3 - Custom Game from FEN
        4 - quit

    HEREDOC
  end
end
