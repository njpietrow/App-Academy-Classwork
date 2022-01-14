require_relative "board.rb"
require_relative "player.rb"

class Game
    def initialize(mark1, mark2)
        @player1 = HumanPlayer.new(mark1)
        @player2 = HumanPlayer.new(mark2)
        @current_player = @player1
        @board = Board.new
    end

    def switch_turn
        @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            mark = @current_player.mark
            @board.place_mark(pos, mark)
            if @board.win?(mark)
                @board.print
                puts "Player #{mark} wins the game"
                return
            else
                self.switch_turn
            end
        end
        puts "draw"
        @board.print
    end
end