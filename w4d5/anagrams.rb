# Our goal today is to write a method that determines if two given words are anagrams.
# This means that the letters in one word can be rearranged to form the other word. For example:

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.

# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string.
# Check if the second string is one of these.

# def inting_anagram?(str1, str2)
#   return str1.split("").permutation(str1.length).to_a.uniq.map(&:join).include?(str2)
# end

# p inting_anagram?("hello", "lloeh")

# Write a method #second_anagram? that iterates over the first string. For each letter in the first string,
# find the index of that letter in the second string (hint: use Array#find_index) and delete at that index.
# The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??

# def less_inting_anagram?(str1, str2)
#   str1.chars.each do |char|
#     idx = str2.index(char)
#     return false if idx.nil?
#     str2[idx] = ""
#   end
#   return str2.length == 0 ? true : false
# end

# p less_inting_anagram?("hello", "lleoh")

# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically.
# The strings are then anagrams if and only if the sorted versions are identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??

