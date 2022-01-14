class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs
  def self.valid_pegs?(chars)
    chars.all? do |char|
      POSSIBLE_PEGS.has_key?(char.upcase)
    end
  end

  def initialize(chars)
    if !Code.valid_pegs?(chars)
      raise "error"
    else
      @pegs = chars.map(&:upcase)
    end
  end

  def self.random(len)
    code = []
    len.times do 
      code << POSSIBLE_PEGS.keys.sample
    end
    Code.new(code)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess_code)
    count = 0
    (0...self.length).each do |i|
      count += 1 if @pegs[i] == guess_code.pegs[i]
    end
    count
  end

  def num_near_matches(guess_code)
    code = Hash.new(0)
    guess = Hash.new(0)

    @pegs.each_with_index do |peg, i| #fill up count hashes with counts of each color peg
      code_peg = @pegs[i]
      guess_peg = guess_code.pegs[i]
      if code_peg != guess_peg
        code[code_peg] += 1
        guess[guess_peg] += 1
      end
    end

    count = 0

    code.each do |k,v|
      potential = [code[k],guess[k]].min
      count += potential
    end

    count
  end

  def ==(guess_code)
    @pegs == guess_code.pegs
  end

end
