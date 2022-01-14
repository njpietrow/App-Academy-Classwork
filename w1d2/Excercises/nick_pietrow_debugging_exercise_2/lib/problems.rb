# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
    (1..num).reverse_each do |factor|
        if num%factor == 0 && prime?(factor)
            return factor
        end
    end
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

def unique_chars?(str)
    hash = letter_counts(str)
    hash.each_value do |count|
        return false if count > 1 
    end
    true
end

def letter_counts(str)
    hash = Hash.new(0)
    str.each_char do |char|
        hash[char.downcase] += 1 
    end
    return hash 
end

def dupe_indices(array)
    
    final_hash = char_indices(array)
    final_hash.select do |k,v|
        v.length > 1
    end
end

def char_indices(array)
    hash = Hash.new() {|hash,k| hash[k] = [] }
    array.each.with_index do |ele,i|
        hash[ele] << i

    end
    return hash 
end

def ana_array(array_1, array_2)
    hash1 = array_eval(array_1)
    hash2 = array_eval(array_2)
    hash1 == hash2
end

def array_eval(array)
    hash = Hash.new(0)
    array.each do |char|
        hash[char.downcase] += 1 
    end
    return hash 
end