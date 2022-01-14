def range_iteration(start, _end)
    return [] if _end < start
    (start..._end).to_a
end

# p range_iteration(1,3)
# p range_iteration(3,1)

def range_recursion(start, _end)
    return [] if _end < start
    return [start] if start +1 == _end

    [start] + range_recursion(start + 1, _end)
end

# p range_recursion(1,3)
# p range_recursion(3,1)

def exp(b, n)
    return 1 if n == 0
    b * exp(b, n - 1)
end

# p exp(3,2)
# p exp(2,3)
# p exp(9,0)

def exp_2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even? 
        result = exp_2(b, n/2)
        return result * result
    else
        result = exp_2(b, (n - 1) / 2)
        return b * result * result
    end
end

# p exp_2(3,2)
# p exp_2(2,3)
# p exp_2(9,0)

class Array
    def deep_dup
        return [self] if !self.is_a?(Array)
        self.map do |data|
            data.is_a?(Array) ? data.deep_dup.dup : data    
        end
    end
end

# p arr = [1, [2], [3, [4]]]
# p barr = arr.deep_dup
# p arr[0].object_id
# p barr[0].object_id

def fibonacci(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2
    prev = fibonacci(n-1)
    prev.concat([prev[-1] + prev[-2]])
end

# p fibonacci(0)
# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(3)
# p fibonacci(4)

def bsearch(array, target)
    return nil if (array.length == 1 && array[0] != target) || array.empty?
    
    middle_idx = array.length/2 
    middle_element = array[middle_idx]

    case middle_element <=> target
    when 1
        bsearch(array[0...middle_idx], target)
    when 0
        middle_idx
    else
        right_side = bsearch(array[middle_idx+1..-1], target)
        (right_side == nil) ?  nil : (right_side + middle_idx + 1)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge(arr_1, arr_2)
    merged_arr = []
    
    while !arr_1.empty? && !arr_2.empty?
        first_1 = arr_1[0]
        first_2 = arr_2[0]
        case first_1 <=> first_2
        when 1
            merged_arr << arr_2.shift
        when -1
            merged_arr << arr_1.shift
        else
            merged_arr += [arr_1.shift, arr_2.shift]
        end
    end

    merged_arr + arr_1 + arr_2
end

# p merge([3, 5], []) # [2,3,5,6,8,9]


#split the array in halves
#call merge sort on each of the halves
# merge the halves together using our helper method
def merge_sort(array)
    return array if array.length <= 1
    middle_idx = array.length/2 
    left_side = array[0...middle_idx]
    right_side = array[middle_idx..-1]
    merge(merge_sort(left_side), merge_sort(right_side))
end

# arr = [3,2,9,8,15,-1,0,42,1]
# p merge_sort(arr)


#add itself
#adds last elemet
#adds last element combined with every other element
#adds subsets([arr[0...-1]]) + all of those^ together
def subsets(array) [1]
    return [array] if array.empty?
    last_ele = array[-1]
    previous_subsets = subsets(array[0...-1])

    new_subsets = previous_subsets.map do |ele|
        ele += [last_ele]
    end
    previous_subsets.concat(new_subsets)
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


# looped through the array array.length times
    #arr[0] add to each of permutations arr[1..-1]
    #add ^ to total arrays
    #rotate the array so the first element is different
#return the total array
def permutations(array) 
    return [array] if array.length <= 1
    total_arr = []

    array.length.times do |i| 
        first_ele = array[0]
        permuts = permutations(array[1..-1])
        permuts.map! {|sub_arr| sub_arr.unshift(first_ele)}
        total_arr += permuts
        array.rotate!
    end

    total_arr
end

# p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
# p permutations([1,2]) # => [[1, 2], [2, 1]]
# p [1,2,3].permutation.to_a

# result is temp variable
# 
# take as many of the biggest coin as possible until result is not smaller than target
# then recall the method using the remainder of target - result, coins - excluding the largest coin
# continue doing until result == target

def greedy_make_change(target, possible_coins)
    return [] if target < 1
    result = []
    while result.sum < target
        result << possible_coins[0]
        return result if result.sum == target
    end
    result.pop
    result + greedy_make_change(target-result.sum,possible_coins[1..-1])
end

p greedy_make_change(21.1, [10, 7, 1]) # => [10, 10, 1, 1, 1, 1]

def make_better_change

end

p make_better_change(24, [10, 7, 1]) # => [10, 7, 7]