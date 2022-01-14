require_relative "card.rb"
require "byebug"

class Board
    def initialize(n)
        @board = Array.new(n) { Array.new(n,"_") }
        @dimension = n
        populate
    end

    def random_pos
      rand_pos = [nil,nil]
      while true
        rand_pos[0] = rand(0...@board.length)
        rand_pos[1] = rand(0...@board.length)
        break if self[rand_pos] == "_"
      end

      rand_pos
    end

    def populate
      while spaces_left?
        card = Card.make_random_card
        rand_pos = self.random_pos
        self[rand_pos] = card

        dup_card = Card.new(card.face_value,false)
        rand_pos_2 = self.random_pos
        self[rand_pos_2] = dup_card
      end
    end

    def won?
      @board.all? do |row|
        row.all? {|card| card.visible? }
      end
    end

    def reveal(guessed_pos)
      if !self[guessed_pos].visible?
        self[guessed_pos].reveal
        self[guessed_pos]
      end
    end

    def render
      print '  '
      (0...@dimension).each do |i|
        print "#{i} "
      end

      (0...@dimension).each do |row_idx|
        puts
        print "#{row_idx} "
        (0...@dimension).each do |col_idx|
          pos = [row_idx, col_idx]
          card = self[pos]
          print "#{card.to_s} "
        end
      end
      puts
    end

    def spaces_left?
      @board.any? do |row|
        row.any? { |card| card == '_' }
      end
    end

    def[](pos) #pos is an array of [row,col]
      @board[pos[0]][pos[1]]
    end

    def[]=(pos, value) #pos is an array of [row,col]
      @board[pos[0]][pos[1]] = value
    end

end