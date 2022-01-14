class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "player #{@mark}" 
        print "enter a position as 'row col': "
        pos = gets.chomp.split(" ").map(&:to_i)
        raise "sorry that was invalid" if pos.length != 2
        pos
    end
end