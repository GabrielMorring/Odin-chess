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

  # Gets a coordinate from the user in the form of a6, e3, etc and converts it to a coordinate in the form of [0, 5], [4, 2] etc
  def self.get_coordinate
    loop do
      input = gets.chomp.strip.to_s.downcase

      unless "abcdefgh".include?(input[0]) && "12345678".include?(input[1])
        puts "Invalid coordinate"
        next
      end

      coordinate = []

      case input[0]
      when "a" then coordinate << 0
      when "b" then coordinate << 1
      when "c" then coordinate << 2
      when "d" then coordinate << 3
      when "e" then coordinate << 4
      when "f" then coordinate << 5
      when "g" then coordinate << 6
      when "h" then coordinate << 7
      end

      coordinate << (input[1].to_i - 1)
      return coordinate
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
    symbols = []

    (0..7).each do |row|
      (0..7).each do |column|
        spot = @board.at(column, row)
        symbol = case spot
                 when Pawn
                   spot.color == "white" ? "♙" : "♟"
                 when Rook
                   spot.color == "white" ? "♖" : "♜"
                 when Knight
                   spot.color == "white" ? "♘" : "♞"
                 when Bishop
                   spot.color == "white" ? "♗" : "♝"
                 when Queen
                   spot.color == "white" ? "♕" : "♛"
                 when King
                   spot.color == "white" ? "♔" : "♚"
                 else
                   " "
                 end
        symbols.push(symbol)
      end
    end

    puts <<~HEREDOC

          a   b   c   d   e   f   g   h
        ┌───┬───┬───┬───┬───┬───┬───┬───┐
      8 | #{symbols[56]} | #{symbols[57]} | #{symbols[58]} | #{symbols[59]} | #{symbols[60]} | #{symbols[61]} | #{symbols[62]} | #{symbols[63]} | 8
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      7 | #{symbols[48]} | #{symbols[49]} | #{symbols[50]} | #{symbols[51]} | #{symbols[52]} | #{symbols[53]} | #{symbols[54]} | #{symbols[55]} | 7
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      6 | #{symbols[40]} | #{symbols[41]} | #{symbols[42]} | #{symbols[43]} | #{symbols[44]} | #{symbols[45]} | #{symbols[46]} | #{symbols[47]} | 6
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      5 | #{symbols[32]} | #{symbols[33]} | #{symbols[34]} | #{symbols[35]} | #{symbols[36]} | #{symbols[37]} | #{symbols[38]} | #{symbols[39]} | 5
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      4 | #{symbols[24]} | #{symbols[25]} | #{symbols[26]} | #{symbols[27]} | #{symbols[28]} | #{symbols[29]} | #{symbols[30]} | #{symbols[31]} | 4
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      3 | #{symbols[16]} | #{symbols[17]} | #{symbols[18]} | #{symbols[19]} | #{symbols[20]} | #{symbols[21]} | #{symbols[22]} | #{symbols[23]} | 3
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      2 | #{symbols[8]} | #{symbols[9]} | #{symbols[10]} | #{symbols[11]} | #{symbols[12]} | #{symbols[13]} | #{symbols[14]} | #{symbols[15]} | 2
        ├───┼───┼───┼───┼───┼───┼───┼───┤
      1 | #{symbols[0]} | #{symbols[1]} | #{symbols[2]} | #{symbols[3]} | #{symbols[4]} | #{symbols[5]} | #{symbols[6]} | #{symbols[7]} | 1
        └───┴───┴───┴───┴───┴───┴───┴───┘
          a   b   c   d   e   f   g   h

    HEREDOC
  end
end
