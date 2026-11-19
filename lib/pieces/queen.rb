require_relative "../piece"

class Queen < Piece
  def initialize(board, color = "white")
    super
  end

  def can_move?(location)
    true
  end

  def valid_move?(start_location, end_location)
    true
  end
end
