require "byebug"

def proper_factors(num)
    (1...num).select {|factor| num % factor == 0}
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    arr = []
    count = 0
    i = 0
    while count < n
        i += 1
        if perfect_number?(i)
            count +=1
            arr << i
        end
    end
    arr
end