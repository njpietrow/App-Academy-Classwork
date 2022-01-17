require_relative "search_module"

class PolyTreeNode
    include Searchable
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
        raise "error, this node is already not a child" if !children.include?(child_node)
        child_node.parent = nil
    end
end
