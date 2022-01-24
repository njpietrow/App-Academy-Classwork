class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0 if self.empty?
    int_arr = self.map.with_index do |ele, idx|
      ele.to_i + idx
    end
    int_arr.inject { |accum, ele| accum ^ ele }
  end
end

class String
  def hash
    self.bytes.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array = []
    self.each {|k,v| array << [k,v]}
    array.sort.flatten.map {|ele| if ele.is_a?(Symbol); ele.object_id;elsif ele.is_a?(String);ele.bytes.sum;else;ele;end}.hash
  end
end
