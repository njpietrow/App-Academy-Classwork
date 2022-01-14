require "byebug"

def element_count(array)
    h = Hash.new(0)
    array.each {|ele| h[ele] += 1}
    h
end

def char_replace!(string, hash)
    string.each_char.with_index { |char,i| string[i] = hash[char] if hash.has_key?(char) }
end

def product_inject(array)
    array.inject{|accum,el| accum *= el}
end