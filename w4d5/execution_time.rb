require 'byebug'
# my_min

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)  # =>  -5

# Phase I
# First, write a function that compares each element to every other element of the list. 
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def comparison(array) # time complexity is O(n^2)
  smallest = 0 
  (0...array.length).each do |i|
    (i...array.length).each do |j|
      smallest = array[j] if array[j] <= array[i] && array[j] < smallest
    end
  end
  smallest
end

# p comparison(list)

# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. 
# What is the time complexity? 

def my_min(array) # time complexity is O(n)
  smallest = 0
  array.each {|num| smallest = num if num < smallest}
  smallest
end

# p my_min(list)




# Largest Contiguous Sub-sum
list1 = [2, 3, -6, 7, -6, 7]
list2 = [-5, -1, -3]

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. 
# First make an array to hold all sub-arrays. 
# Then find the sums of each sub-array and return the max.
# Discuss the time complexity of this solution.

def iter_sub(array)
  sub_arrays = []
  (0...array.length).each do |i|
    (i...array.length).each do |j|
      sub_arrays << array[i..j].sum
    end
  end
  return sub_arrays.sort[-1]
end

# p iter_sub(list1)
# p iter_sub(list2)


# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. 
# Keep a running tally of the largest sum. To accomplish this efficient space complexity, 
# consider using two variables. One variable should track the largest sum so far and another to 
# track the current sum. We'll leave the rest to you.

# def better_sub_sum(array)
#   max_sum = nil
#   i = 0
#   while i < array.length
#     current_sum = nil
#     while i < array.length
#       if current_sum.nil?
#         current_sum = array[i]
#       else
#         current_sum += array[i]
#       end
#       debugger
#       # current_sum.nil? ? current_sum = array[i] : current_sum += array[i]
#       max_sum = current_sum if max_sum.nil? || current_sum > max_sum
#       i += 1
#       break if current_sum < max_sum
#     end
#   end
#   return max_sum
# end



p better_sub_sum(list1)
p better_sub_sum(list2)