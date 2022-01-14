require "byebug"

def average(num_1, num_2)
    sum = num_1 + num_2
    sum/2.0
end

def average_array(array)
   
    sum = array.inject {|accum,ele| accum + ele}
    sum / (array.length * 1.0)
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sentence)
    words = sentence.split
    new1 = words.map.with_index do |ele, i|
        if i%2 == 0
            ele.upcase 
        else
            ele.downcase
        end
    end
    new1.join(" ")
end