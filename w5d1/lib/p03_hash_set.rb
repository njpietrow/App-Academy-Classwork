class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return nil if include?(key)
    resize! if count >= num_buckets
    self[key] << key
    @count += 1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    return nil unless include?(key)
    self[key].delete(key)
    @count -= 1
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `num`
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(2*num_buckets) {Array.new}
    @store.each do |bucket|
      bucket.each do |ele|
        new_store[ele.hash % (2 * num_buckets)] << ele
      end
    end
    @store = new_store
  end
end
