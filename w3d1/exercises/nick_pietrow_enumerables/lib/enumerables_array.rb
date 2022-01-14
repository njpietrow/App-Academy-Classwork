require "byebug"

# ==========================================================================================
# Starting off with the warmup exercises. Actual exercises are included below
#  factors, subword, doubler   ---   bubble_sort!, my_each, my_map, my_select, my_inject, concatenate
# ==========================================================================================

class Array
  def my_each(&prc)
    i = 0

    while i < self.length
      prc.call(self[i])
      i+=1
    end
    
    self
  end

  def my_select(&prc)
    arr = []
    self.my_each {|ele| arr << ele if prc.call(ele)}
    arr
  end

  def my_reject(&prc)
    arr = []
    self.my_each {|ele| arr << ele unless prc.call(ele)}
    arr
  end

  def my_any?(&prc)
    self.my_each {|ele| return true if prc.call(ele)}
    false
  end

  def my_all?(&prc)
    self.my_each {|ele| return false unless prc.call(ele)}
    true
  end

  # [[1, [2]], 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
  def my_flatten
    arr = []
    # debugger
    self.my_each do |ele|
      if ele.kind_of?(Array)
        arr += ele.my_flatten
      else
        arr << ele
      end 
    end
    arr
  end

  # args is an array of arrays.
  def my_zip(*args)
    args.unshift(self)
    zipped = Array.new(self.length){Array.new}

    (0...self.length).each do |idx|
      args.each do |sub_arr|
        zipped[idx] << sub_arr[idx]
      end
    end

    zipped
  end

  def my_rotate(num = 1)
    rotated_arr = self.dup

    if num > 0
      num.times do
        first_ele = rotated_arr.shift
        rotated_arr.push(first_ele)
      end
    else
      num.abs.times do
        last_ele = rotated_arr.pop
        rotated_arr.unshift(last_ele)
      end
    end

    rotated_arr
  end

  def my_join(separator = "")
    joined_str = ""

    self.each_with_index do |ele,i|
      unless i == self.length - 1
        joined_str += "#{ele}#{separator}"
      else
        joined_str += "#{ele}"
      end
    end

    joined_str
  end

  def my_reverse
    reversed_arr = []
    (self.length-1).downto(0) do |i|
      reversed_arr << self[i]
    end
    reversed_arr
  end
end

# ==========================================================================================
# The actual exercises are below this line.
# ==========================================================================================

# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
  factors = []
  
  (1..num).each do |potential_factor|
    factors << potential_factor if num % potential_factor == 0
  end

  factors
end

# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new {|a,b| a <=> b}
    sorted = false

    while !sorted
      sorted = true
      i = 0
      while i < self.length - 1 
        if prc.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
        i+=1
      end
    end

    self
  end

  def bubble_sort(&prc)
    to_sort = self.dup
    to_sort.bubble_sort!(&prc)
  end
end

# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
  substrings = []
    (0...string.length).each do |idx|
      (idx...string.length).each do |idx2|
        substrings << string[idx..idx2]
      end
    end
  substrings.uniq
end

def subwords(word, dictionary)
  substrings = substrings(word)
  substrings.select {|ele| dictionary.include?(ele)}
end

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
    array.map {|ele| ele*2}
end

# ### My Each
# Extend the Array class to include a method named `my_each` that takes a
# block, calls the block on every element of the array, and then returns
# the original array. Do not use Enumerable's `each` method. I want to be
# able to write:
#
# ```ruby
# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3
#
# p return_value # => [1, 2, 3]
# ```

class Array
  def my_each(&prc)
    i = 0

    while i < self.length
      prc.call(self[i])
      i+=1
    end
    
    self
  end
end

# ### My Enumerable Methods
# * Implement new `Array` methods `my_map` and `my_select`. Do
#   it by monkey-patching the `Array` class. Don't use any of the
#   original versions when writing these. Use your `my_each` method to
#   define the others. Remember that `each`/`map`/`select` do not modify
#   the original array.
# * Implement a `my_inject` method. Your version shouldn't take an
#   optional starting argument; just use the first element. Ruby's
#   `inject` is fancy (you can write `[1, 2, 3].inject(:+)` to shorten
#   up `[1, 2, 3].inject { |sum, num| sum + num }`), but do the block
#   (and not the symbol) version. Again, use your `my_each` to define
#   `my_inject`. Again, do not modify the original array.

class Array
  def my_map(&prc)
    mapped_arr = []
    self.my_each {|ele| mapped_arr << prc.call(ele)} 
    mapped_arr
  end

  def my_select(&prc)
    selected_arr = []
    self.my_each {|ele| selected_arr << ele if prc.call(ele)} 
    selected_arr
  end

  def my_inject(&blk)
    accum = self[0]
    i = 0
    self.my_each do |ele|
      if i != 0
        accum = blk.call(accum, ele)
      end
      i+=1
    end
    accum
  end
  
end

# ### Concatenate
# Create a method that takes in an `Array` of `String`s and uses `inject`
# to return the concatenation of the strings.
#
# ```ruby
# concatenate(["Yay ", "for ", "strings!"])
# # => "Yay for strings!"
# ```

def concatenate(strings)
  strings.inject() {|sentence,word| "#{sentence}#{word}" }
end