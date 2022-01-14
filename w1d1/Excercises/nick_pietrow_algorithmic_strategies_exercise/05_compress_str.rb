# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
   new_str = ""
   idx=0

   while idx < str.length
        char = str[idx]

        repeat_counter = 0
        while char == str[idx]
            repeat_counter += 1
            idx += 1
        end

        if repeat_counter > 1
            new_str += repeat_counter.to_s + char
        else
            new_str += char
        end
   end
   new_str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
