require_relative "board"

class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    self.symbol
  end

  def valid_moves

  end
end