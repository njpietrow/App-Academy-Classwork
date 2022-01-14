require "byebug"

def palindrome?(string)
	reverse = ""
	(0...string.length).each do |i|
		reverse += string[-i-1]
	end
	string == reverse
end

def substrings(string)
	substrings = []
	(0...string.length).each do |idx|
		(idx...string.length).each do |idx2|
			substrings << string[idx..idx2]
		end
	end
	substrings
end

def palindrome_substrings(string)
	subs = substrings(string)
	subs.reject {|substr| !palindrome?(substr) ||  substr.length<2}
end