class Board
    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n,:N)}
        @size = n * n
    end

    def self.print_grid(p_grid)
        p_grid.each do |row|
            string = row.join(" ")
            puts "#{string}"
        end
    end

    def [] (pos) #position taken in as array of [row#,col#]
        @grid[pos.first][pos.last]
    end

    def []= (pos,val)
        @grid[pos.first][pos.last] = val
    end

    def num_ships
        count = 0
        @grid.each do |row|
            count += row.count {|ele| ele == :S}
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        count = 0
        target = @size / 4.0
        length = @grid.length
        while count < target
            pos = [rand(0...length),rand(0...length)]
            if self[pos] == :N
                self[pos] = :S
                count += 1
            end
        end
    end

    def hidden_ships_grid
        n = @grid.length
        hidden_grid = Array.new(n) {Array.new(n,:N)}
        (0...n).each do |row|
            (0...n).each do |col| 
                if self[[row,col]] == :S
                    hidden_grid[row][col] = :N
                else
                    hidden_grid[row][col] = self[[row,col]]
                end
            end
        end
        hidden_grid
    end

    def cheat
        self.class.print_grid(@grid)
    end

    def print
        self.class.print_grid(self.hidden_ships_grid)
    end

end
