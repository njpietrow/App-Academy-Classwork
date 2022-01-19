# require_relative "piece"

require_relative "null_piece"
require_relative "rook"
require_relative "bishop"
require_relative "queen"
require_relative "knight"
require_relative "king"

require "pp"


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
    self[end_pos].pos = end_pos
  end

  def inbounds?(pos)
    row, col = pos
    row >= 0 && row <= 7 && col >= 0 && col <= 7
  end

  def print_board
    @rows.each do |row|
      row.map! {|ele| ele.to_s}
      print row
      puts
    end
  end

  private
  attr_accessor :rows

  def fill_board
    @rows.each_with_index do |row, row_index|
      if row_index < 2
        col = -1
        row.map! do |ele| 
          col +=1
          Rook.new("white", self, [row_index, col]) 
        end
      elsif row_index > 5
        col = -1
        row.map! do |ele| 
          col +=1
          Bishop.new("black", self, [row_index, col]) 
        end
      end
    end
  end

  
end

b = Board.new 
rook1 = b[[1,0]]
p rook1.moves
bishop1 = b[[6,0]]
p bishop1.moves

b.move_piece([1,0],[2,0])
rook1 = b[[2,0]]
p rook1.moves
b.print_board