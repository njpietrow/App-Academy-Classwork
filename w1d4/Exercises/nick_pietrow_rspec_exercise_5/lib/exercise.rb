require "byebug"

# def zip(*arrays)
#     depth = arrays[0].length
#     new_array = Array.new(depth) {Array.new(arrays.length)}
#     (0...depth).each do |ele_idx|
#         arrays.each_with_index do |c_array,arr_idx|
#             new_array[ele_idx][arr_idx] = c_array[ele_idx] 

#         end
#     end
#     new_array
# end

def zip(*arrays)
    length = arrays.first.length

    (0...length).map do |col|
        arrays.map do |array|
            array[col]
        end
    end

end

def prizz_proc(array, prc_1, prc_2)
    selected = array.select {|ele| (prc_1.call(ele)||prc_2.call(ele)) && !(prc_1.call(ele)&&prc_2.call(ele))}
    selected
end

def zany_zip(*arrays)
    arr = []
    max_l = arrays.inject(0) {|max, ele| ele.length > max ? ele.length : max}
    (0...max_l).each do |x|
        sub_arr = []
        (0...arrays.length).each do |sub_a|
            sub_arr << arrays[sub_a][x]
        end
        arr << sub_arr
    end
    arr
end

def maximum(array, &prc)
    array.inject {|accum,ele| prc.call(ele) >= prc.call(accum) ? ele : accum}
end

def my_group_by(array, &prc)
    h = Hash.new {|h,k| h[k]=[]}
    array.each do |ele|
        h[prc.call(ele)] << ele
    end
    h
end

# def max_tie_breaker(array, prc_1, &prc_2)
#     h = Hash.new(0)
#     array.each do |ele|
#         h[ele] = prc_2.call(ele)
#     end
#     # debugger
#     sorted = h.sort_by {|k,v| v }

#     return nil if sorted.empty?

#     if sorted.length > 1 && sorted[-1][1] == sorted[-2][1] #need to run through prc_1
#         # need to filter out all non-max elements.
#         sort_by = delete_non_max(sorted)
#         new_h = Hash.new(0)
#         sorted.each do |ele|
#             new_h[ele[0]] = prc_1.call(ele[0])
#         end
#         sorted = new_h.sort_by {|k,v| v }
#         if sorted.length > 1 && sorted[-1][1] == sorted[-2][1]
#             return sorted[0][0]
#         else
#             return sorted[-1][0]
#         end
#     else
#         return sorted[-1][0]
#     end
# end

# def delete_non_max(two_d_array)
#     max = two_d_array[-1][1]
#     two_d_array.select! {|key_value| key_value[1]==max}
# end

def max_tie_breaker(array, prc, &block)
    max = array.inject do |max,ele|
        if block.call(ele) > block.call(max)
            ele
        elsif (block.call(ele) == block.call(max)) && (prc.call(ele)  > prc.call(max))
            ele
        else
            max
        end
    end
    max
end

def silly_syllables(sentence)
    vowels="aeiou"
    words = sentence.split(" ")

    words.map! do |word|
        if vowel_count(word,vowels) >= 2
            trim_word(word,vowels) 
        else
            word
        end
    end

    words.join(" ")
end

def vowel_count(word, vowels)
    count = 0
    word.each_char {|char|count += 1 if vowels.include?(char) }
    count
end

def trim_word(word, vowels)
    index_1 = nil
    index_2 = nil
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            index_1 = i
            break
        end
    end
    word.reverse.each_char.with_index do |char, i|
        if vowels.include?(char)
            index_2 = word.length - 1 - i
            break
        end
    end
    word[index_1..index_2]
end