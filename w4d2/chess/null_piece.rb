require "singleton"

class NullPiece
  include Singleton

  attr_reader :empty, :symbol

  def initialize
    @empty = true
    @symbol = ""
  end

  def moves
    []
  end
end