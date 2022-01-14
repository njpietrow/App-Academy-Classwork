require "set"

class GraphNode
  attr_accessor :neighbors
  attr_reader :val
  def initialize(val)
    @val = val
    @neighbors = []
  end
end

def bfs(starting_node, target_value)
  queue = Queue.new
  queue.enq(starting_node)

  set = Set.new
  set << starting_node.val
  until queue.empty?
    el = queue.deq
    return el if el.val == target_value
    el.neighbors.each do |node|
      queue.enq(node) if !set.include?(node.val)
    end
  end
  nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")