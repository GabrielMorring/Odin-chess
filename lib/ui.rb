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

  def display_custom_game_prompt
    puts <<~HEREDOC

      FEN is a notation to describe the position of a chess game.
      Type or paste FEN to start a game from that position.
      It must be in the correct format or it will not work.
      Below is an example FEN for a starting game. I do not use the halfmove or fullmove fields.

      rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq -

    HEREDOC
  end

  def display_board
    puts <<~HEREDOC

          a   b   c   d   e   f   g   h
        ┌───┬───┬───┬───┬───┬───┬───┬───┐
      8 | #{} | #{} | #{} | #{} | #{} | #{} | #{} | #{} | 8
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      7 | #{} | #{} | #{} | #{} | #{} | #{} | #{} | #{} | 7
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      6 | #{} | #{} | #{} | #{} | #{} | #{} | #{} | #{} | 6
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      5 | #{} | #{} | #{} | #{} | #{} | #{} | #{} | #{} | 5
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      4 | #{} | #{} | #{} | #{} | #{} | #{} | #{} | #{} | 4
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      3 | #{} | #{} | #{} | #{} | #{} | #{} | #{} | #{} | 3
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      2 | #{} | #{} | #{} | #{} | #{} | #{} | #{} | #{} | 2
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      1 | #{} | #{} | #{} | #{} | #{} | #{} | #{} | #{} | 1
        └───┴───┴───┴───┴───┴───┴───┴───┘
          a   b   c   d   e   f   g   h

    HEREDOC
  end
end
