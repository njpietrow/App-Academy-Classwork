# require_relative "piece"
require_relative "null_piece"
require_relative "rook"
require_relative "bishop"
require_relative "queen"
require_relative "knight"
require_relative "king"

class Board


  def initialize
    @rows = Array.new(8) {Array.new(8,NullPiece.instance)}
    fill_board
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].instance_of?(NullPiece) 
      raise "No piece at starting position."
    end

    if !inbounds?(end_pos)
      raise "End position not on board."
    end

    if !self[end_pos].instance_of?(NullPiece) 
      raise "End position filled with piece."
    end

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def inbounds?(pos)
    row, col = pos
    row >= 0 && row <= 7 && col >= 0 && col <= 7
  end

  private
  attr_accessor :rows

  def fill_board
    @rows.each_with_index do |row, row_index|
      if row_index < 2
        row.map! {|ele, col| Rook.new("white", self, [row_index, col])}
      elsif row_index > 5
        row.map! {|ele, col| Bishop.new("black", self, [row_index, col])}
      end
    end
  end

  
end

p Board.new