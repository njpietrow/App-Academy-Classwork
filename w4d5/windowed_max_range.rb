# Given an array and a window size w, find the maximum range (max - min)
# within a set of w elements.

# Let's say we are given the array [1, 2, 3, 5] and a window size of 3. Here,
# there are only two cases to consider:

# 1. [1 2 3] 5
# 2. 1 [2 3 5]
# In the first case, the difference between the max and min elements of the window
# is two (3 - 1 == 2). In the second case, that difference is three (5 - 2 == 3).
# We want to write a function that will return the larger of these two differences.

def windowed_max_range(arr, w)
  current_max_range = nil
  (0...arr.length - (w - 1)).each do |i|
    min = arr[i..i + (w - 1)].min
    max = arr[i..i + (w - 1)].max
    range = max - min
    if current_max_range.nil?
      current_max_range = range
    elsif current_max_range < range
      current_max_range = range
    end
  end
  return current_max_range
end

# def windowed_max_range(arr, w)
#   current_max_range = nil
#   (0...arr.length - (w - 1)).each do |i|
#     min = arr[i]
#     max = arr[i + (w - 1)]
#     range = max - min
#     if current_max_range.nil?
#       current_max_range = range
#     elsif current_max_range < range
#       current_max_range = range
#     end
#   end
#   return current_max_range
# end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
  def initialize
    @store = []
  end

  def peek
    return store.first
  end

  def size
    return store.size
  end
  
  def enqueue(ele)
    store << ele
    return nil
  end

  def dequeue
    return store.shift
  end

  def empty?
    return store.length == 0
  end

  private
  attr_reader :store
end

class MyStack
  def initialize
    @store = []
  end

  def peek
    return store[-1]
  end

  def pop
    return store.pop
  end

  def push(ele)
    store.push(ele)
    return nil
  end

  def size
    return store.length
  end

  def empty?
    return store.length == 0
  end

  attr_reader :store
end

class StackQueue
  def initialize
    @queue = [MyStack.new,MyStack.new]
  end

  def size
    queue[0].length + queue[1].length
  end

  def empty?
    queue[0].empty? && queue[1].empty?
  end

  def enqueue(ele)
    until queue[1].empty?
      queue[0].push(queue[1].pop)
    end
    queue[1].push(ele)
  end

  def dequeue
    until queue[0].empty?
      queue[1].push(queue[0].pop)
    end
    queue[1].pop
  end

  attr_reader :queue
end

class MinMaxStack

end

class MinMaxStackQueue

end