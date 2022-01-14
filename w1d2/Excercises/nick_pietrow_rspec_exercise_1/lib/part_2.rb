require "byebug"

def hipsterfy(word)
    vowels = 'aeiou'
    i = word.length-1
    while i >= 0
        char = word[i]
        if vowels.include?(char)
            word[i] = ""
            return word
        end
        i -= 1
    end
    word
end

def vowel_counts(str)
    vowels = 'aeiouAEIOU'
    hash = Hash.new(0)
    str.each_char do |char|
        hash[char.downcase] += 1 if vowels.include?(char)
    end
    return hash 
end

def caesar_cipher(message, n)
    alphabet = ("a".."z").to_a  
    message.each_char.with_index do |char, i|
        if alphabet.include?(char)
            idx = alphabet.index(char)
            idx = (idx + n) % 26
            message[i] = alphabet[idx]
        end
    end
    message

end