require_relative "lib/ui"
require_relative "lib/fen"

require_relative "lib/board"
require_relative "lib/chess_game"
require_relative "lib/main_menu"
require_relative "lib/piece"
require_relative "lib/player"

require_relative "lib/pieces/bishop"
require_relative "lib/pieces/king"
require_relative "lib/pieces/knight"
require_relative "lib/pieces/pawn"
require_relative "lib/pieces/queen"
require_relative "lib/pieces/rook"

MainMenu.new.start
