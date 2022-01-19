require 'colorize'

class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s #can add color here.
    self.symbol.colorize(color)
  end

  def valid_moves
    #uses move_into_check, rejects check moves
  end

  def empty?
    false
  end

  def pos=(val)
    @pos = val
  end

  
  protected
  attr_reader :pos, :board, :color
end
