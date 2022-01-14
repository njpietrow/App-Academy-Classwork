require "byebug"

def no_dupes?(arr)
    h = Hash.new(0)
    arr.each {|ele| h[ele] += 1}
    h.keep_if {|k,v| v == 1}
    h.keys
end

# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    h = Hash.new {|h,k| h[k] = [] }
    
    str.each_char.with_index do |char, idx|
        h[char] << idx
    end
    
    h
end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    i = 0
    len = 0
    streak = ""
    while i < str.length
        char = str[i]
        while str[i] == char #get the next char
            # debugger
            if str[i-len..i].to_s.length >= streak.length
                streak = str[i-len..i]
            end
            len += 1
            i +=1
        end
        len = 0
    end
    streak
end

# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    prime_factors = []

    (2...num).each do |fac|
        prime_factors << fac if num%fac == 0 && prime?(fac)
    end

    prime_factors.each do |fac|
        return true if prime_factors.include?(num/fac)
    end

    false
end

def prime?(num)
    return true if num < 2
    (2...num).each {|fac| return false if num%fac == 0}
    true
end

# Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a
    new_message = ""

    message.each_char do |char|
        new_message += alpha[(alpha.index(char) + keys.first)%26]
        keys = keys.rotate
    end

    new_message
end

# # Examples
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = "aeiou"
    chars = str.split("")
    vs = []

    chars.map! do |ele|
        if vowels.include?(ele)
            vs << ele
            " "
        else
            ele
        end
    end

    vs = vs.rotate(-1)

    chars.map! do |ele|
        ele == " " ? vs.shift : ele
    end
    
    chars.join("")
end

# # Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&prc)
        prc ||= Proc.new {|ele| false }
        new_str = ""
        self.each_char {|char| new_str << char if prc.call(char)}
        new_str
    end

    # p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
    # p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
    # p "HELLOworld".select          # => ""

    def map!(&prc)
        self.each_char.with_index do |char,i|
            self[i] = prc.call(char,i)
        end
        self
    end  
end
    # # Examples
    # word_1 = "Lovelace"
    # word_1.map! do |ch| 
    # if ch == 'e'
    #     '3'
    # elsif ch == 'a'
    #     '4'
    # else
    #     ch
    # end
    # end
    # p word_1        # => "Lov3l4c3"

    # word_2 = "Dijkstra"
    # word_2.map! do |ch, i|
    # if i.even?
    #     ch.upcase
    # else
    #     ch.downcase
    # end
    # end
    # p word_2        # => "DiJkStRa"

def multiply(a, b)
    return a if b == 1 
    return (-1*a) if b == -1 #flip a's sign if b is negative

    if b > 0
        return a + multiply(a,b-1)
    else
        return (-1*a) + multiply(a,b+1) #flip a's sign if b is negative
    end
end

# Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(len)
    if len == 0
        return [] 
    elsif len == 1
        return [2] 
    elsif len == 2
        return [2,1] 
    end

    arr = lucas_sequence(len-1)
    return  arr + [arr[-2] + arr[-1]]
end

# Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(4)   # => [2, 1, 3, 4]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

# get factors, dive down until prime then return
def prime_factorization(num)
    # debugger
    return [num] if num == 2
    (2...num).each do |fac|
        if num % fac == 0
            return prime_factorization(fac) + prime_factorization(num/fac)
        end
    end
    [num]
end

# Examples
# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]