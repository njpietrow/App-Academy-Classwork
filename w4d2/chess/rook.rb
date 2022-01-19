require_relative "piece"
require_relative "slideable"

class Rook < Piece
  include Slideable

  # todo - symbol method.
  def symbol
    "♖".colorize(color)
  end

  private
  def move_dirs
    horizontal_dirs
  end
end

