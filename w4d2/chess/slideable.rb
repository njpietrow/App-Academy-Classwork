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

  end


  private
  def move_dirs
    #overwritten by subclass
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    
  end
end
