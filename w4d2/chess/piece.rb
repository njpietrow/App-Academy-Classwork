require_relative "board"
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

  end


  protected
  attr_reader :pos, :board, :color
end