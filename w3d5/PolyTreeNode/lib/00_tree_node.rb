class PolyTreeNode
    attr_accessor :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node = nil )
        # return nil if @parent == nil
        if @parent != nil
            @parent.children.each_with_index do |child,i|
                if self == child
                    @parent.children.delete_at(i) #delete child from parent node
                    @parent = nil                 #delete parent from child node
                end
            end
        end

        if node != nil
            node.children << self
            @parent = node
        end
    end

    def add_child(child_node)
        child_node.parent = self if !children.include?(child_node)
    end

    def remove_child(child_node)
        raise "error" if !children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self == nil || value == target_value
        children.each do |child|
            result = child.dfs(target_value)
            return result if result != nil
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue << self 
        until queue.empty?
            first_child = queue.shift
            return first_child if first_child.value == target_value
            first_child.children.each do |child|
                queue << child
            end
        end
        nil
    end


end
