require "byebug"
require_relative "player"

class Game
  def self.get_dictionary
    word_data = File.read("dictionary.txt").split
    h = {}
    word_data.each {|word| h[word] = nil}
    h
  end

  attr_reader :current_player, :previous_player
  def initialize(name_1, name_2)
    @player_1 = Player.new(name_1)
    @player_2 = Player.new(name_2)
    @current_player = @player_1
    @previous_player = nil
    @fragment = ""
    @dictionary = Game.get_dictionary
  end

  def next_player!
    if @current_player == @player_1  
      @current_player = @player_2
      @previous_player = @player_1
    else
      @current_player = @player_1
      @previous_player = @player_2
    end
  end

  def valid_play? #checks if fragment is a valid word.

  end
end

if __FILE__ == $PROGRAM_NAME
  g = Game.new("Nick","Bot")
end