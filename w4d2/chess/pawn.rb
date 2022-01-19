require_relative "piece"

class Pawn < Piece

  def symbol
    "♙"
  end

  def moves
    possible_moves = []

  end

  private
  def forward_steps
    forward_moves = []
    forward_dir # => [1,0] or [-1,0]
    if at_start_row?
      start_move = forward_dir[0]*2
      forward_moves << forward_dir
      forward_moves << [start_move,0]
    else
      forward_moves << forward_dir
    end
    forward_moves
  end

  def at_start_row? #based on the color of the pieces assuming white is at top of board.
    return true if color == :white && pos[0] == 1
    return true if color == :black && pos[0] == 6
    false
  end

  def side_attacks
    
  end

  def forward_dir
    if self.color == :white
      [1,0]
    else
      [-1,0]
    end
  end

  #forward dir direction based off color
  #start_row based off color black = 1, white = 6
  #forward_steps lets us know if we can move one or two forward and if piece is in the way
  #side_attacks forward_dir diags have opposing piece in them
end