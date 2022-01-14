class Board
    def initialize
        @grid = Array.new(3) {Array.new(3,"_")}
    end

    def valid?(position)
        row = position.first
        col = position.last
        return false if row < 0 || row > 2 || col < 0 || col > 2
        true
    end

    def empty?(position)
        @grid[position.first][position.last] == "_"

    end

    def place_mark(position,mark)
        if !self.valid?(position) || !self.empty?(position)
            raise "Can't place mark there"
        else
            @grid[position.first][position.last] = mark
        end
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? do |row|
            row.all? do |ele|
                ele == mark
            end
        end
    end

    def win_col?(mark)
        (0...3).any? do |col_idx|
            @grid.all? do |row|
                row[col_idx] == mark
            end
        end
    end

    def win_diagonal?(mark)
        down_right = (0...3).all? do |i|
            @grid[i][i] == mark
        end

        down_left = (0...3).all? do |i|
            @grid[i][-i-1] == mark
        end

        down_left || down_right
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? do |row|
            row.any? do |ele|
                ele == "_"
            end
        end
    end
end