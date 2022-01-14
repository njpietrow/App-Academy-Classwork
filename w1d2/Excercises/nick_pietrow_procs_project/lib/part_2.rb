require "byebug"

def reverser(str,&prc)
    prc.call(str.reverse)
end

def word_changer(sentence,&prc)
    words = sentence.split(" ")
    words.map! {|word| prc.call(word)}
    words.join(" ")
end

def greater_proc_value(num,prc1,prc2)
    one = prc1.call(num)
    two = prc2.call(num)
    if one > two
        one
    else
        two
    end
end

def and_selector(array,prc1,prc2)
    new_arr = array.select {|ele| prc1.call(ele) && prc2.call(ele)}
    new_arr
end

def alternating_mapper(array,prc1,prc2)
    new_arr = array.map.with_index do |ele,i|
        if i.even?
            prc1.call(ele)
        else
            prc2.call(ele)
        end
    end
    new_arr
end


