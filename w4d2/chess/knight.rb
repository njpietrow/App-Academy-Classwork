require_relative "piece"

class Knight < Piece
  MOVES = [
    [2,1],
    [1,2],
    [-2,1],
    [-1,2],
    [2,-1],
    [1,-2],
    [-2,-1],
    [-1,-2]
  ]

  def moves
    move_diffs
  end
  
  def symbol
    "♘".colorize(color)
  end

  protected
  def move_diffs
    row, col = pos
    MOVES.map do |move|
      [(row + move.first), (col + move.last)]
    end
  end
end