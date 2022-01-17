require_relative "../PolyTreeNode/lib/00_tree_node.rb"

class KnightPathFinder
    # select only positions from the array that are withing the 8x8 range.
    BOARD_LENGTH = 8
    MOVES = [
        [row + 1, col + 2],
        [row - 1, col + 2],
        [row + 1, col - 2],
        [row - 1, col - 2],
        [row + 2, col + 1],
        [row + 2, col - 1],
        [row - 2, col + 1],
        [row - 2, col - 1]
    ]
    def self.valid_moves(pos) 
        row, col = pos
        selected = moves.select do |move| 
            move[0]<= (BOARD_LENGTH - 1) &&
            move[1]<= (BOARD_LENGTH - 1) &&
            move[0]>=0 &&
            move[1]>=0 
        end
        selected.map {|move| PolyTreeNode.new(move) }
    
    end

    def initialize(start_pos)
        @considered_positions = [PolyTreeNode.new(start_pos)]
    end

    def print_considered_positions
        p get_considered_values
        p get_considered_values.length
    end

    def get_considered_values
        @considered_positions.map do |node|
            node.value
        end
    end

    def new_move_positions(pos)
        positions = KnightPathFinder.valid_moves(pos)
        filtered = positions.select { |psn| !get_considered_values.include?(psn.value) }
        @considered_positions += filtered
        filtered
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
end


k = KnightPathFinder.new([0,0])
k.print_considered_positions
k.build_move_tree
k.print_considered_positions