# Define your methods here.

def string_map!(str, &prc)
    (0...str.length).map {|i| str[i] = prc.call(str[i])}
end

def three?(arr, &prc)
    count = 0
    arr.each {|ele| count += 1 if prc.call(ele)}
    count == 3
end

def nand_select(arr, prc_1, prc_2)
    arr.select {|ele| !(prc_1.call(ele) && prc_2.call(ele))}
end

def hash_of_array_sum(hash)
    hash.values.flatten.sum
end

def abbreviate(sentence)
    sentence
        .split(" ")
        .map {|word| word.length > 4 ? remove_vowels(word) : word}
        .join(" ")
end

def remove_vowels(word)
    vowels="aeiouAEIOU"
    word
        .split("")
        .map {|char| char if !vowels.include?(char)}
        .join("")
end

def hash_selector(hash, *args)
    return hash if args.empty?
    h = {}
    hash.each {|k,v| h[k] = v if args.include?(k)}
    h
end