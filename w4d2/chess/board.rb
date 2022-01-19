require_relative "piece"

class Board


  def initialize
    @rows = Array.new(8) {Array.new(8,nil)}
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
    if !self[start_pos].instance_of?(Piece) 
      raise "No piece at starting position."
    end

    if !inbounds?(end_pos)
      raise "End position not on board."
    end

    if self[end_pos].instance_of?(Piece) 
      raise "End position filled with piece."
    end

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  private
  attr_accessor :rows

  def fill_board
    @rows.each_with_index do |row,index|
      if index < 2 || index > 5
        row.map! {|ele| Piece.new}
      end
    end
  end

  def inbounds?(pos)
    row, col = pos
    row >= 0 && row <= 7 && col >= 0 && col <= 7
  end
end

# p Board.new