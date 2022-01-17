
module Searchable
  def dfs(target_value)
    return self if self == nil || self.value == target_value
    self.children.each do |child|
        result = child.dfs(target_value)
        return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
        ele = queue.shift
        return ele if ele.value == target_value
        ele.children.each do |child|
            queue << child
        end
    end
    nil
  end
end