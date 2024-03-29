

require_relative "null_piece"
require_relative "rook"
require_relative "bishop"
require_relative "queen"
require_relative "knight"
require_relative "king"
require_relative "pawn"


class Board

  attr_accessor :rows

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
    if start_pos == end_pos
      raise ArgumentError.new("Cannot move piece to the same position. Start = End")
    end

    if self[start_pos].instance_of?(NullPiece) 
      raise ArgumentError.new("No piece at starting position.")
    end

    if !inbounds?(end_pos)
      raise ArgumentError.new("End position not on board.")
    end

    # need to check if end position is 
    #within the valid movset of the piece that is in the starting position
    if self[start_pos].color == self[end_pos].color
      raise ArgumentError.new("End position filled with your own piece.")
    end

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    self[end_pos].pos = end_pos
  end

  def inbounds?(pos)
    row, col = pos
    row >= 0 && row <= 7 && col >= 0 && col <= 7
  end

  private

  def fill_board
    @rows.each_with_index do |row, row_index|
      case row_index
      when 0
        row.each_with_index do |ele, col_idx| 
          case col_idx
          when 0, 7
            self[[row_index, col_idx]] = Rook.new(:white, self, [row_index, col_idx]) 
          when 1,6
            self[[row_index, col_idx]] = Knight.new(:white, self, [row_index, col_idx]) 
          when 2,5
            self[[row_index, col_idx]] = Bishop.new(:white, self, [row_index, col_idx]) 
          when 3
            self[[row_index, col_idx]] = King.new(:white, self, [row_index, col_idx])
          when 4
            self[[row_index, col_idx]] = Queen.new(:white, self, [row_index, col_idx])
          end
        end
      when 1
        row.each_with_index do |ele, col_idx| 
          self[[row_index, col_idx]] = Pawn.new(:white, self, [row_index, col_idx]) 
        end
      when 6
        row.each_with_index do |ele, col_idx| 
          self[[row_index, col_idx]] = Pawn.new(:black, self, [row_index, col_idx]) 
        end
      when 7
        row.each_with_index do |ele, col_idx| 
          case col_idx
          when 0, 7
            self[[row_index, col_idx]] = Rook.new(:black, self, [row_index, col_idx]) 
          when 1,6
            self[[row_index, col_idx]] = Knight.new(:black, self, [row_index, col_idx]) 
          when 2,5
            self[[row_index, col_idx]] = Bishop.new(:black, self, [row_index, col_idx]) 
          when 3
            self[[row_index, col_idx]] = King.new(:black, self, [row_index, col_idx])
          when 4
            self[[row_index, col_idx]] = Queen.new(:black, self, [row_index, col_idx])
          end
        end
      end
    end
  end

  
end

# b = Board.new 
# pawn = b[[6,0]]
# # p pawn.moves

# b.print_board
# b.move_piece([6,0],[2,1])
# # pawn = b[[2,1]]
# p pawn.moves
# b.print_board