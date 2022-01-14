class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length,"_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    (0...@secret_word.length).each do |i|
      indices << i if char == @secret_word[i]
    end
    indices
  end

  def fill_indices(char, indices)
    indices.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      false
    else  
      @attempted_chars << char
      indices = self.get_matching_indices(char)
      self.fill_indices(char, indices)
      @remaining_incorrect_guesses -= 1 if indices.empty?
      true
    end
  end

  def ask_user_for_guess
    print "Enter a char:"
    input = gets.chomp
    self.try_guess(input)
  end

  def win?
    if @secret_word == @guess_word.join
      puts "WIN"
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      true
    else
      false
    end
  end
end
