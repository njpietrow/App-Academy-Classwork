class Board
  def initialize
    @rows = Array.new(8) {Array.new(8,nil)}
  end

  private
  def fill_board
    @rows.each_with_index do |row,index|
      if index < 2 || index > 5
        row.map! {|ele| Piece.new}
      end
    end
  end
end