require "byebug"

def duos(string)
    (0...string.length-1).count {|i| string[i] == string[i+1] }
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sentence, hash)
    words = sentence.split(" ")
    
    words.map! do |word|
        if hash.has_key?(word)
            hash[word]
        else
            word
        end
    end

    words.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, prc, &blk)
    h = Hash.new()
    hash.each do |k,v| 
        h[blk.call(k)] = prc.call(v)
    end
    h
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(sentence)
    h = Hash.new(0)
    sentence.each_char {|char| h[char] += 1}
    h.keep_if {|k,v| v > 2}
    h.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(string)
    (0...string.length-2).any? {|i| (string[i] == string[i+1]) && (string[i+1] == string[i+2]) }
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(string, hash)
    string.each_char.with_index do |char,i|
        if hash.has_key?(char)
            string[i] = hash[char]
        elsif char != " "
            string[i] = "?"
        end
    end
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(string)
    new_str = ""
    i=0
    while i < string.length
        new_str += (string[i] * string[i+1].to_i)
        i += 2
    end
    new_str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

