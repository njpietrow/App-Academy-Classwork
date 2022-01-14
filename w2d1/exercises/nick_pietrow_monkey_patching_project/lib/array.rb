# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if !self.empty?
      self.max - self.min
    else
      nil
    end
  end

  def average
    if !self.empty?
      self.sum / (self.length * 1.0)
    else
      nil
    end
  end

  def median
    if !self.empty?
      if self.length.odd?
        middle = self.length / 2
        self.sort[middle]
      else
        middle = self.length / 2
        arr = self.sort
        (self.sort[middle-1] + self.sort[middle]) / 2.0
      end
    else
      nil
    end
  end

  def counts
    h = Hash.new(0)
    self.each {|ele| h[ele] +=1 }
    h
  end

  def my_count(val)
    count = 0
    self.each {|ele| count +=1 if ele == val }
    count
  end

  def my_index(val)
    (0...self.length).each {|i| return i if val == self[i]}
    nil
  end

  def my_uniq
    new_arr = []
    self.each {|ele| new_arr << ele if !new_arr.include?(ele)}
    new_arr
  end

  def my_transpose
    new_arr = Array.new(self.length) {Array.new(self.length,nil)}

    (0...self.length).each do |y|
      (0...self.length).each do |x|
        new_arr[x][y] = self[y][x]
      end
    end

    new_arr
  end
end
