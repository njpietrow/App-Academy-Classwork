require "byebug"

def mersenne_prime(num)
    m_primes = []
    curr = 3
    while m_primes.length < num
        m_primes << curr if (power_of_two?(curr+1) && prime?(curr))
        curr += 1
    end
    m_primes[-1]

end

def prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    true
end

def power_of_two?(num)
    curr = 1

    while curr < num
        curr *= 2
    end
    curr == num
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(str)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    val = 0
    str.each_char do |char|
        val += alphabet.index(char)+1
    end
    triangular_number?(val)
end

def triangular_number?(num)
    val = 1
    last = 1
    while last < num
        last = (val*(val+1))/2.0
        val += 1
    end
    last == num
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(numbers)
    reducible = true
    i = 0
    while reducible
        reducible = false
        # debugger
        while i < numbers.length - 1
            curr = numbers[i]
            n_neighbor = numbers[i+1]
            if (curr == n_neighbor - 1) || (curr == n_neighbor + 1)
                numbers = numbers[0...i] + numbers[i+2..-1]
                reducible = true
                i=0
                next
            else
                i += 1
            end
            
        end
    end
    numbers
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def pretentious_primes(array, n)
    
    primes = array.map do |num|
        count = 0
        if n > 0
            num += 1
            while count < n
                if prime?(num)
                    count += 1
                    next if count == n
                end
                num += 1
            end
            num  
        else
            num -= 1
            while count < -1*n && num > 0
                if prime?(num)
                    count += 1
                    next if count == -1*n
                end
                num -= 1
            end
            if num < 2
                nil
            else
                num
            end
        end
    end
    primes

end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]