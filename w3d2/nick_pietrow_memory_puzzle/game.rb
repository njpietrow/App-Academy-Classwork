require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
  def initialize(n, name, is_comp)
    @board = Board.new(n)
    @prev_guess = [nil, nil]
    if is_comp
      @player = ComputerPlayer.new(n, name)
    else
      @player = HumanPlayer.new(name)
    end
  end

  def play
    until @board.won?
      system("clear")
      @board.render
      pos = @player.prompt
      self.make_guess(pos)
    end
    @board.render
    puts "You Win"
  end

  def make_guess(pos)
    if @board[pos].visible?
      puts "That card has already been flipped"
      sleep(3)
      return
    elsif @prev_guess[0] == nil
      @prev_guess[0] = @board.reveal(pos)
      @prev_guess[1] = pos
      self.send_revealed_card(pos)
      return
    elsif @board.reveal(pos) == @prev_guess[0]
      #leave cards face up and do nothing.
      self.send_match(pos)
    else
      self.send_revealed_card(pos)
      @board.reveal(pos)
      @board.render
      sleep(3)
      @board[pos].hide
      @prev_guess[0].hide
    end
    @prev_guess[0] = nil
    @prev_guess[1] = nil
  end

  def send_match(pos)
    pos_2 = @prev_guess[1]
    @player.receive_match(pos, pos_2)
  end

  def send_revealed_card(pos)
    face_val = @board[pos].face_value
    @player.receive_revealed_card(pos, face_val)
  end

end