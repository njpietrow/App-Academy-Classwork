require "byebug"

def is_prime?(num)
    return false if num < 2
    (2...num).none? { |factor| num%factor == 0}
end

def nth_prime(n)
    i, p_count = 0, 0
    while p_count < n
        i += 1
        p_count += 1 if is_prime?(i)
    end
    i
end

def prime_range(min, max)
    new_arr = (min..max).select {|num| is_prime?(num)}

end