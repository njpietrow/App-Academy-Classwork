def bad_two_sum?(arr, target_sum) #O(n^2)
  pairs = []
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      pairs << [arr[i],arr[j]] if i != j && (arr[i] + arr[j]) == target_sum
    end
  end
  pairs.each{|pair| return true if pair.sum == target_sum}
  false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def bsearch(arr, target)
  return nil if arr.size == 0
  mid = arr.size/2

  case arr[mid] <=> target
  when 0
    return mid
  when 1
    return bsearch(arr.take(mid), target)
  else
    search_res = bsearch(arr.drop(mid+1), target)
    search_res.nil? ? nil : mid + 1 + search_res
  end
end

def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  arr.each {|num| return true if !(bsearch(sorted,(target_sum-num))).nil?}
  false
end

# arr = [1000, 0, 1, 5, 7 , 8, 9, -5, -3]
# p okay_two_sum?(arr, -8)

# Finally, it's time to bust out the big guns: a hash map. Remember, a hash map has O(1) #set and O(1) #get,
# so you can build a hash out of each of the n elements in your array in O(n) time.
# That hash map prevents you from having to repeatedly find values in the array; now you can just look them up instantly.

# See if you can solve the two_sum? problem in linear time now, using your hash map.

# Once you're finished, make sure you understand the time complexity of your solutions.
# Then call over your TA and show them what you've got. Defend to them why
# each of your solutions has the time complexity you claim it does.

def two_sum(arr, target_sum)
  h = {}
  arr.each do |num|
    return true if h.key(num)
    h[num] = target_sum - num
  end
  return false
end

arr = [1000, 0, 1, 5, 7 , 8, 9, -5, -3]
p two_sum(arr, 1009)