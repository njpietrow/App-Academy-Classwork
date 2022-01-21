def my_uniq(array)
  uniq_array = []
  array.each {|ele| uniq_array << ele if !uniq_array.include?(ele)}
  uniq_array
end

class Array
  def two_sum 
    indicies = []
    (0...self.length).each do |idx1|
      (idx1 + 1...self.length).each do |idx2|
        indicies << [idx1,idx2] if (self[idx1] + self[idx2]) == 0 
      end 
    end 
    indicies
  end
end

def my_transpose(array)
  (0...array.length).each do |i|
    raise "Array is not square" if array.length != array[i].length
  end
  tranposed = Array.new(array.length) {Array.new(array.length)}
  (0...array.length).each do |idx1|
    (0...array.length).each do |idx2|
      tranposed[idx2][idx1] = array[idx1][idx2]
    end
  end
  tranposed
end

def stock_picker(stock_prices)
  raise "Please pass in an array" unless stock_prices.is_a?(Array)
  indicies = []
  max_profit = 0
  (0...stock_prices.length - 1).each do |idx1|
    (idx1 + 1...stock_prices.length).each do |idx2|
      profit = stock_prices[idx2] - stock_prices[idx1] 
      if profit > max_profit 
        indicies = [idx1, idx2] 
        max_profit = profit
      end
    end 
  end 
  indicies
end

class Towers
  attr_reader :stacks
  def initialize
    @stacks = [[3,2,1,0],[],[]]
  end

  def move(start_idx, end_idx)
    return "Empty start position" if stacks[start_idx].empty?

    disk = stacks[start_idx].pop
    if stacks[end_idx].empty? || disk < stacks[end_idx][-1]
      stacks[end_idx].push(disk)
    else
      stacks[start_idx].push(disk)
    end
  end

  def won?
    stacks[1].length == 4 || stacks[2].length == 4
  end

  def play 
    until won?
      p stacks
      print "enter a starting positition and ending position, 'start, end' "
      indicies = gets.chomp.split(",").map(&:to_i)
      move(*indicies)
    end
  end
end

t = Towers.new
t.play