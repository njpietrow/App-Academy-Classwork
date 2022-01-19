module Slideable
  HORIZONTAL_DIRS = [
    [1,0],
    [-1,0],
    [0,1],
    [0,-1]
  ]
  DIAGONAL_DIRS = [
    [1,1],
    [-1,1],
    [-1,-1],
    [1,-1]
  ]

  def horizontal_dirs 
    HORIZONTAL_DIRS
  end

  def diagonal_dirs 
    DIAGONAL_DIRS
  end

  def moves
    potential_moves = move_dirs #returns up,right,down,left
    possible_moves = []
    
    potential_moves.each do |dir|
      row,col = dir
      possible_moves += grow_unblocked_moves_in_dir(row,col)
    end

    possible_moves
  end


  private
  def move_dirs
    #overwritten by subclass
  end

  def grow_unblocked_moves_in_dir(change_in_row, change_in_col)
    # iteratively increment values for row and/or col
    # for each increment, check if piece is there/inbounds.
    # return array of all possible positions
    # puts " pos is #{pos}"
    new_pos = pos.dup
    possible_moves = []

    while true
      # puts " new_pos is #{new_pos}"
      new_pos = [new_pos[0] + change_in_row , new_pos[1] + change_in_col]
      if board.inbounds?(new_pos) 
        if board[new_pos].empty?
          possible_moves << new_pos
        elsif opposite_color?(new_pos)
          possible_moves << new_pos
          break
        else
          break
        end
      else
        break
      end
    end

    possible_moves
  end


  # def inbounds?(pos)
  #   row, col = pos
  #   row >= 0 && row <= 7 && col >= 0 && col <= 7
  # end

  def opposite_color?(new_pos)
    board[new_pos].color != self.color
  end
end
