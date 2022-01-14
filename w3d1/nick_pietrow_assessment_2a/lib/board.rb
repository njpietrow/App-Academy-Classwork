class Board 
    attr_reader :size
    def initialize(size)
        @size = size
        @grid = Array.new(size) {Array.new(size)}
    end

    def [](pos)
        row = pos.first
        col = pos.last
        @grid[row][col]
    end

    def []=(pos, mark)
        row = pos.first
        col = pos.last
        @grid[row][col] = mark
    end

    def complete_row?(mark)
        @grid.any? do |row|
            row.all? do |ele|
                ele == mark
            end
        end
    end

    def complete_col?(mark)
        (0...@size).any? do |col_idx|
            @grid.all? do |row|
                row[col_idx] == mark
            end
        end
    end

    def complete_diag?(mark)
        down_right = (0...@size).all? do |i|
            @grid[i][i] == mark
        end

        down_left = (0...@size).all? do |i|
            @grid[i][-i-1] == mark
        end

        down_right || down_left
    end

    def winner?(mark)
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
