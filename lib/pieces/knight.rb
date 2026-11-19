require_relative "../piece"

class Knight < Piece
  def initialize(board, color = "white")
    super
  end

  def can_move?(location)
    moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

    new_locations = []

    moves.each do |move|
      new_locations << [location[0] + move[0], location[1] + move[1]]
    end

    movable = false

    new_locations.each do |spot|
      if spot[0] >= 0 && spot[0] < 8 && spot[1] >= 0 && spot[1] < 8 && (@board.at(spot).nil? || @board.at(spot).color != color)

        movable = true
      end
    end
    movable
  end

  def valid_move?(start_location, end_location)
    moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

    new_locations = []

    moves.each do |move|
      new_locations << [start_location[0] + move[0], start_location[1] + move[1]]
    end

    return false unless new_locations.include?(end_location)
    return false if !@board.at(end_location).nil? && @board.at(end_location).color == color

    true
  end
end
