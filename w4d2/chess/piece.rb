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

  def empty?
    false
  end

  def pos=(val)
    @pos = val
  end

  
  protected
  attr_reader :pos, :board, :color
end
