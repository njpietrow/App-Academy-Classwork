require_relative "board" 
require_relative "human_player"

class Game
    def initialize(mark_1, mark_2)
        @board = Board.new()
        @player_1 = Human_player.new(mark_1)
        @player_2 = Human_player.new(mark_2)
        @current_player = @player_1
    end

    def switch_turn
        (@current_player == @player_1) ? @current_player = @player_2 : @current_player = @player_1
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
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

# g = Game.new(:X,:O)
# g.play
