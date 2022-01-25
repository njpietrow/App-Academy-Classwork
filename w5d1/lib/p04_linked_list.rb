
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @next.prev = @prev
    @prev.next = @next
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new(:head, :head)
    @tail = Node.new(:tail, :tail)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    return nil unless self.include?(key)
    self.each {|current| return current.val if current.key == key}
  end

  def include?(key)
    self.each {|current| return true if current.key == key}
    false
  end

  def append(key, val)
    node = Node.new(key,val)
    node.next = @tail
    node.prev = @tail.prev
    @tail.prev.next = node
    @tail.prev = node
  end

  def update(key, val)
    self.each {|current| return current.val = val if current.key == key}
  end

  def remove(key)
    self.each {|current| current.remove if current.key == key}
  end

  def each(&prc)
    current = first
    until current == @tail
      prc.call(current)
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
