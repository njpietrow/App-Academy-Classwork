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