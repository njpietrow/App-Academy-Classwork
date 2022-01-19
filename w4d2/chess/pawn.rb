require_relative "piece"

class Pawn < Piece

  def symbol
    "♙"
  end

  def moves
    possible_steps = forward_steps

    possible_steps.select! do |move|
      new_pos = [pos.first + move.first, pos.last + move.last]
      board[new_pos].empty?
    end

    possible_attacks = side_attacks

    possible_attacks.select! do |move|
      new_pos = [pos.first + move.first, pos.last + move.last]
      opposite_color?(new_pos) && !board[new_pos].empty?
    end

    possible_steps + possible_attacks
  end

  private
  def forward_steps
    forward_moves = []
    forward_moves << [forward_dir, 0]
    if at_start_row?
      start_move = forward_dir*2
      forward_moves << [start_move,0]
    end
    forward_moves
  end

  def at_start_row? #based on the color of the pieces assuming white is at top of board.
    return true if color == :white && pos[0] == 1
    return true if color == :black && pos[0] == 6
    false
  end

  def side_attacks
    [[forward_dir, 1], [forward_dir, -1]]
  end

  def forward_dir
    if self.color == :white
      1
    else
      -1
    end
  end

  #forward dir direction based off color
  #start_row based off color black = 1, white = 6
  #forward_steps lets us know if we can move one or two forward and if piece is in the way
  #side_attacks forward_dir diags have opposing piece in them
end