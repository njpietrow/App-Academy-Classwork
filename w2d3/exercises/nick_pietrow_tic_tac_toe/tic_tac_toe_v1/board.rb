require "byebug"

class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(3){Array.new(3,'_')}
        @dim = 3
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
        diag_check = true
        (0...@dim).each do |i|
            if @grid[i][i] != symbol
                diag_check = false
            end
        end
        return true if diag_check

        diag_check = true
        (0...@dim).each do |i|
            if @grid[-i-1][i] != symbol
                diag_check = false
            end
        end
        return true if diag_check
        false
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
end
