require_relative "piece"
require_relative "slideable"

class Queen < Piece
  include Slideable

  # todo - symbol method.
  def symbol
    "♕".colorize(color)
  end

  private
  def move_dirs
    diagonal_dirs + horizontal_dirs
  end
end