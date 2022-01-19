require 'colorize'

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
    #uses move_into_check, rejects check moves
  end


  protected
  attr_reader :pos, :board, :color
end

p Piece.new("white", "board", [0,0])