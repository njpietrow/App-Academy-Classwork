require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs
  def initialize(chars) #accepts array of chars
    @pegs = []
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise "The pegs are not valid"
    end
  end

  def self.valid_pegs?(chars) #accepts array of chars and checks if valid
    chars.map(&:upcase).all? {|char| POSSIBLE_PEGS.include?(char)}
  end

  def self.random(length)
    random_chars = (0...length).map {|i| POSSIBLE_PEGS.keys.sample}
    Code.new(random_chars)
  end

  def self.from_string(string)
    chars = string.split("").map(&:upcase)
    Code.new(chars)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_guess)
    count = 0
    (0...code_guess.length).each do |i| 
      guess_c = code_guess.pegs[i]
      actual_c = self.pegs[i]
      count += 1 if guess_c == actual_c
    end
    count
  end

  # loop through guess and mark indices of all exact matches
  # loop through guess and mark indices of all near matches, while checking that the index is not already in exact matches or near matches.
  def num_near_matches(guess_code)
    code_hash = Hash.new(0)
    guess_hash = Hash.new(0)
    exact_match_hash = Hash.new(0)

    guess_code.pegs.each_with_index do |peg,i|
      code_hash[@pegs[i]] += 1
      guess_hash[guess_code.pegs[i]] += 1
      exact_match_hash[@pegs[i]] += 1 if @pegs[i] == guess_code.pegs[i] 
    end

    count = 0
    
    code_hash.each do |peg,v|
      code_hash[peg] -= exact_match_hash[peg]
      guess_hash[peg] -= exact_match_hash[peg]
      # check overlap between code and guess value amounts
      count += [code_hash[peg], guess_hash[peg]].min
    end
    count
  end

  def ==(code_guess)
    code_guess.length == self.length && num_exact_matches(code_guess) == self.length
  end

end
