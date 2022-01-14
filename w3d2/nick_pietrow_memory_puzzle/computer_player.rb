class ComputerPlayer
    def initialize(n, name)
        @length = n
        @name = name
        @known_cards = {}
        @matched_cards = []
    end

    def known_match?
        
    end

    def prompt
      if @known_cards.empty?
        rand_row = rand(0...@length)
        rand_col = rand(0...@length)
        pos = [rand_row, rand_col]
        return pos
      end

      pos
    end

    def receive_revealed_card(pos, face_value)
        @known_cards[pos] = face_value
    end

    def receive_match(pos_1, pos_2)
        @matched_cards << pos_1
        @matched_cards << pos_2
    end
end