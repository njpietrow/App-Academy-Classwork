require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    def initialize(board_size, hash)
        @board = Board.new(board_size)
        @players = []
        hash.each do |mark,computer|
            if computer
                @players << Computer_player.new(mark)
            else
                @players << Human_player.new(mark)
            end
        end
        @current_player = @players.first
    end

    def switch_turn
        @players.rotate!
        @current_player = @players.first
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position(@board.legal_positions)
            @board.place_mark(pos,@current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                puts "Game Over! Player #{@current_player.mark} wins game\n-----------------"
                return true
            else
                self.switch_turn
            end
        end
        @board.print
        puts "Draw!\nThere are no more empty positions on the board...\n-----------------"
    end
end

# g = Game.new(2, X: false, O: false)
# g.play
