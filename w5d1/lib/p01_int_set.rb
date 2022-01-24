class MaxIntSet
  attr_reader :store, :max

  def initialize(max)
    @store = Array.new(max+1, false) 
    @max = max
  end

  def insert(num)
    validate!(num)
    store[num] = true
  end

  def remove(num)
    validate!(num)
    store[num] = false
  end

  def include?(num)
    validate!(num)
    store[num]
  end

  private


  def is_valid?(num)
    num.between?(0, max)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private


  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % 20]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return nil if include?(num)
    resize! if count >= num_buckets
    self[num] << num
    @count += 1
  end

  def remove(num)
    return nil unless include?(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(2*num_buckets) {Array.new}
    store.each do |bucket|
      bucket.each do |ele|
        new_store[ele % (2 * num_buckets)] << ele
      end
    end
    @store = new_store
  end
end
