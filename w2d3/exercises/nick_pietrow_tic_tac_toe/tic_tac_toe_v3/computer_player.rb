class Computer_player
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
       random_pos = legal_positions.sample
       puts "Computer #{@mark} chose position #{random_pos}..."
       random_pos
    end
end