require_relative "piece"

class Pawn < Piece

  def symbol
    "♙"
  end

  def moves

  end

  private
  #forward dir direction based off color
  #start row based off color black = 1, white = 6
  #forward_steps lets us know if we can move one or two forward and if piece is in the way
  #side_attacks forward_dir diags have opposing piece in them
end