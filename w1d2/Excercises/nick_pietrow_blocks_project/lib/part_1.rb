require "byebug"

def select_even_nums(array)
    array.select {|num| num.even?}
end

def reject_puppies(array)
    array.reject {|dog| dog["age"]<3}
end

def count_positive_subarrays(twod_array)
    twod_array.count {|sub_array| sub_array.sum > 0}
end

def aba_translate(word)
    new_word = ""
    word.each_char do |char| 
        if "aeiou".include?(char)
            new_word += (char + "b" + char)
        else
            new_word += char
        end
    end  
    new_word
end

def aba_array(array)
    array.map {|word| aba_translate(word)}

end