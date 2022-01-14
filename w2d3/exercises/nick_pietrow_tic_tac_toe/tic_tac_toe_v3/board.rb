require "byebug"

class Board
    attr_reader :grid
    def initialize(n)
        @grid = Array.new(n){Array.new(n,'_')}
        @dim = n
    end

    def valid?(pos) #accepts position in form of array of coordinates.
        x = pos.first
        y = pos.last
        x > -1 && x < @dim && y > -1 && y < @dim
    end

    def empty?(pos) 
        @grid[-pos.last-1][pos.first] == '_' #updated to show grid starting at bottom left
    end

    def place_mark(pos, mark) 
        if !valid?(pos)
            raise "this board position is not valid"     
        elsif !empty?(pos)
            raise "this position has already been claimed"
        else
            @grid[-pos.last-1][pos.first] = mark #updated to show grid starting at bottom left
        end
    end

    def print
        @grid.each {|row| p row}
    end
    
    def win_row?(symbol)
        @grid.each do |row|
            return true if row.all? {|ele| ele == symbol}
        end
        false
    end

    def win_col?(symbol)
        @grid.transpose.each do |row|
            return true if row.all? {|ele| ele == symbol}
        end
        false
    end

    def win_diagonal?(symbol)
        down_right = (0...@dim).all? do |i|
            @grid[i][i] == symbol
        end

        down_left = (0...@dim).all? do |i|
            @grid[i][-i-1] == symbol
        end

        down_right || down_left
    end

    def win?(symbol)
        win_row?(symbol) || win_col?(symbol) || win_diagonal?(symbol)
    end

    def empty_positions?
        @grid.each do |row|
            return true if row.any? {|ele| ele == '_'}
        end
        false
    end

    def legal_positions
        legal_positions = []
        @grid.each_with_index do |row,y|
            row.each_with_index do |ele,x|
                legal_positions << [x,y] if @grid[-y-1][x] == '_'
            end
        end
        legal_positions
    end
end
