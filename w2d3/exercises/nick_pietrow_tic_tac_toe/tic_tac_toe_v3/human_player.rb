require "byebug"

class Human_player
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    # print the players mark so we know whose turn it is
    # prompt them for a move
    # validate that the input meets the position array criteria, one space, numbers only, 2 numbers.
    def get_position(legal_positions)
        print "Player #{@mark}, please enter you next move in the form 'row col':: "
        input = gets.chomp.split.map(&:to_i)
        while !legal_positions.include?(input)
            puts "#{input} is not a legal position" if !legal_positions.include?(input)
            print "Player #{@mark}, please enter you next move in the form 'row col':: "
            input = gets.chomp.split.map(&:to_i)
        end
        input

                # if input.length != 2
                #     raise "Please enter a position with a row and col"
                # elsif !(input.first.to_i.to_s == input.first && input.last.to_i.to_s == input.last) 
                #     raise "Please enter integer positions only"
                # end
        
    end

end
