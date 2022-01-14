class Board
    attr_reader :size
    def initialize(n)
        @grid = Array.new(n){Array.new(n,:N)}
        @size = n*n
        @dim = n
    end

    def[](pos)
        @grid[pos.first][pos.last]
    end

    def[]=(pos,val)
        @grid[pos.first][pos.last] = val
    end
    
    def num_ships
        count = 0
        @grid.each do |row|
            count += row.count(:S)
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship"
            true
        else
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        while num_ships < (@size/4)
            self[[rand(0...@dim),rand(0...@dim)]] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
           puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
