require "byebug"

def partition(array, num)
    new_arr = [[],[]]
    array.each do |ele|
        if ele < num
            new_arr[0] << ele
        else
            new_arr[1] << ele
        end
    end
    new_arr
end

def merge(hash_1, hash_2)
    hash = {}
    hash_1.each {|k,v| hash[k] = v}
    hash_2.each {|k,v| hash[k] = v}
    hash
end

def censor(sentence, curse_words)
    vowels = "aeiouAEIOU"
    clean = sentence.split(" ").map do |word|
        if curse_words.include?(word.downcase)
            replace_vowels(word)
        else
            word
        end
    end
    clean.join(" ")
end

def replace_vowels(curse_word)
    vowels = "aeiouAEIOU"
    clean_word = ""
    curse_word.each_char do |char|
        if vowels.include?(char)
            clean_word += "*"
        else
            clean_word += char
        end
    end
    clean_word
end

def power_of_two?(num)
    i = 1
    while i < num
        i *= 2
    end
    i == num
end




