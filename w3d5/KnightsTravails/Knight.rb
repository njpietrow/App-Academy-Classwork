require_relative "../PolyTreeNode/lib/00_tree_node.rb"

class KnightPathFinder

    # select only positions from the array that are withing the 8x8 range.
    def self.valid_moves(pos) 
        row, col = pos
        moves = [
            [row + 1, col + 2],
            [row - 1, col + 2],
            [row + 1, col - 2],
            [row - 1, col - 2],
            [row + 2, col + 1],
            [row + 2, col - 1],
            [row - 2, col + 1],
            [row - 2, col - 1]
        ]
        moves
            .select{|move| (move[0]<=7 && move[1]<=7) && (move[0]>=0 && move[1]>=0)  }
            .map {|move| PolyTreeNode.new(move) }
    
    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [@root_node]
    end

    def new_move_positions(pos)
        positions = KnightPathFinder.valid_positions(pos)
        filtered = positions.select { |psn| !@considered_positions.include?(psn) }
        @considered_positions += filtered
        filtered
    end

    # start with root node and explore moves one position at a time
    # build nodes representing postions one move away (aka new_move_positions(start))
    # add to queue, take next node from queue, until queue is empty
    def build_move_tree 
        moves = []
        moves << @root_node
        until moves.empty?
            first_move = moves.shift
            new_move_positions(first_move.value).each do |child|
                moves << child
                child.parent = first_move
            end
        end
        nil
    end

    
end