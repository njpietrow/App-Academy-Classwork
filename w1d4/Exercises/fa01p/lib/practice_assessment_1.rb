# Define your methods here. 
require "byebug"

def first_letter_vowel_count(sentence)
    vowels = "aeiouAEIOU" 
    sentence.split(" ").count {|word| vowels.include?(word[0])}
end

def count_true (array, prc)
    array.count {|ele| prc.call(ele)}
end

def procformation(array, prc_1, prc_2, prc_3)
    array.map {|ele| prc_1.call(ele) ? prc_2.call(ele) : prc_3.call(ele)}
end

def array_of_array_sum(two_d_array)
    two_d_array.flatten.sum
end

def selective_reverse(sentence)
    vowels = "aeiouAEIOU"
    words = sentence.split(" ").map  {|word| (vowels.include?(word[0]) || vowels.include?(word[-1])) ? word : word.reverse}
    words.join(" ")
end

def hash_missing_keys(hash,*args)
    args.reject {|ele| hash.has_key?(ele)}
end