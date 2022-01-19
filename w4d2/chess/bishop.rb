require_relative "piece"
require_relative "slideable"

class Bishop < Piece
  include Slideable
  
  # todo - symbol method.
  def symbol
    "♗"
  end

  private
  def move_dirs
    diagonal_dirs
  end
end
