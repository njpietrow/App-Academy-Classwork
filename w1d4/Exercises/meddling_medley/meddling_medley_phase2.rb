require "byebug"

def conjunct_select(array,*prcs)
    array.select {|ele| prcs.all? {|prc| prc.call(ele)}}
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sentence)
    words = sentence.split(" ")
    vowels = "aeiou"

    words.map! do |word|
        if word.length < 3
            word
        elsif vowels.include?(word[0].downcase)
            word += "yay"
        else
            piglatinify(word, vowels)
        end
    end
    words.join(" ")
end

def piglatinify(word,vowels)
    i = nil
    
    (0...word.length).each do |idx|
        if vowels.include?(word[idx])
            i = idx
            break
        end
    end

    capital = true if (word[0]) == (word[0].upcase)
    word = word[i..-1] + word[0...i].downcase + "ay"

    if capital
        return word.capitalize
    else
        return word
    end
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sentence)
    vowels = "aeiouAEIOU"
    words = sentence.split(" ").map do |word|
        if word.length < 3
            word
        elsif vowels.include?(word[-1])
            word[0].upcase == word[0] ? (word*2).capitalize : word*2
        else
            repeat_word(word, vowels)
        end
    end
    words.join(" ")
end

def repeat_word(word, vowels)
    idx = 0
    word.reverse.each_char.with_index do |char,i|
        if vowels.include?(char)  
           idx = word.length - 1 - i
           break 
        end
    end
    word += word[idx..-1]
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(array, *prcs)
    array.select {|ele| prcs.any? {|prc| prc.call(ele)}}
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sentence)
    vowels = "aeiouAEIOU"
    i = 1
    words = sentence.split(" ").map do |word|
        i += 1
        remove_vowel(word,i,vowels)
    end
    words.join(" ")
end

def remove_vowel(word,i,vowels)
    if i.even? #remove first vowel
        word.each_char.with_index do |char,i|
            if vowels.include?(char)
                word[i] = ""
                return word
                break
            end
        end
    else #remove last vowel
        word.reverse.each_char.with_index do |char,i|
            if vowels.include?(char)
                word[word.length - i - 1] = ""
                return word
                break
            end
        end
    end
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sentence)
    vowels = "aeiouAEIOU"

    words = sentence.split(" ").map do |word|
        if vowels.include?(word[-1])
            word += word[-1]
        else
            sillyify(word, vowels)
        end
    end
    
    words.join(" ")
end

def sillyify(word,vowels)
    new_word = ""

    word.each_char.with_index do |char,i|
        if vowels.include?(char)
            new_word += (char + "b" + char.downcase)
        else
            new_word += char
        end
    end

    new_word
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(str) #use double while loops, use same counter, only iterate in inner loop.
    new_str = ""

    i=0
    while i < str.length
        char = str[i]
        count = 0

        while str[i] == char
            count += 1
            i+=1
        end

        count > 1 ? (new_str += char + count.to_s) : (new_str += char)
    end

    new_str
end

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"