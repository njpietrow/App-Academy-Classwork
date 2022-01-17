require_relative "../PolyTreeNode/lib/00_tree_node.rb"

class KnightPathFinder
    # select only positions from the array that are withing the 8x8 range.
    @@board_length = 8
    attr_reader :root_node
 
    def self.valid_moves(pos) 
        row, col = pos
        moves = [
            [row + 1, col + 2], [row - 1, col + 2],
            [row + 1, col - 2], [row - 1, col - 2],
            [row + 2, col + 1], [row + 2, col - 1],
            [row - 2, col + 1], [row - 2, col - 1]
        ]
        selected = moves.select do |move| 
            move[0]<= (@@board_length - 1) &&
            move[1]<= (@@board_length - 1) &&
            move[0]>=0 &&
            move[1]>=0 
        end
        selected.map {|move| PolyTreeNode.new(move) }
    end

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [@root_node]
    end

    def print_considered_positions
        p get_considered_values
        p get_considered_values.length
    end

    # start with root node and explore moves one position at a time
    # build nodes representing postions one move away (aka new_move_positions(start))
    # add to queue, take next node from queue, until queue is empty
    def build_move_tree 
        moves = []
        moves << @considered_positions.first
        until moves.empty?
            first_move = moves.shift
            new_move_positions(first_move.value).each do |child|
                moves << child
                child.parent = first_move
            end
        end
        nil
    end 

    def find_path(end_pos)
        target = @root_node.bfs(end_pos)
        trace_back_path(target)
    end

    private
    def new_move_positions(pos)
        positions = KnightPathFinder.valid_moves(pos)
        filtered = positions.select { |psn| !get_considered_values.include?(psn.value) }
        @considered_positions += filtered
        filtered
    end

    def get_considered_values
        @considered_positions.map do |node|
            node.value
        end
    end

    def trace_back_path(node)
        path = [node.value]
        curr = node
        while curr != nil
            path << curr.parent.value unless curr.parent.nil?
            curr = curr.parent
        end
        path
    end
end


k = KnightPathFinder.new([0,0])
k.print_considered_positions
k.build_move_tree
k.print_considered_positions
p k.find_path([7,6])
p k.find_path([6,2])

