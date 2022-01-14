require "byebug"

def my_reject(array,&prc)
    new_arr = []
    array.each do |ele|
        new_arr << ele if !prc.call(ele)
    end 
    new_arr
end

def my_one?(array, &prc)
    count = 0
    array.each {|ele| count += 1 if prc.call(ele)}
    count == 1
end

def hash_select(hash, &prc)
    h = Hash.new()
    hash.each {|k,v|h[k]=v if prc.call(k,v) }
    h
end

def xor_select(array, prc_1, prc_2)
    new_array = []
    new_array = array.select do |ele|
        !(prc_1.call(ele) && prc_2.call(ele)) && (prc_1.call(ele) || prc_2.call(ele))
    end
    new_array
end

def proc_count(val,prcs)
    prcs.count {|prc| prc.call(val)}
end
