def my_uniq(array)
  uniq_array = []
  array.each {|ele| uniq_array << ele if !uniq_array.include?(ele)}
  uniq_array
end