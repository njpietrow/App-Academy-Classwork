class King < Piece
  MOVES = [
    [1,0],
    [1,-1],
    [0,-1],
    [-1,-1],
    [-1,0],
    [-1,1],
    [0,1],
    [1,1]
  ]

  def moves
    move_diffs
  end
  
  protected
  def move_diffs
    row, col = pos
    MOVES.map do |move|
      [(row + move.first), (col + move.last)]
    end
  end
end