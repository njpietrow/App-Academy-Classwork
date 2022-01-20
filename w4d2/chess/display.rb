require_relative "cursor"
require_relative "board"
require 'colorize'

class Display

  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0],board)
  end


  def render
    board.rows.each_with_index do |row, row_idx|
      row.each_with_index do |ele, col_idx|
        if ([row_idx, col_idx] == cursor.cursor_pos) && !cursor.selected
          print (ele.to_s + " ").colorize(:background => :red)
        elsif ([row_idx, col_idx] == cursor.cursor_pos) && cursor.selected
          print (ele.to_s + " ").colorize(:background => :blue)
        else
          print (ele.to_s + " ")
        end
      end
      puts
    end
  end

  def make_move
    turn = nil
    while true
      render 
      cursor.get_input
      system("clear")
    end
  end

end

b = Board.new
d = Display.new(b)
d.make_move