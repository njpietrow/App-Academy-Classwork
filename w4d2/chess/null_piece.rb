require "singleton"
require_relative "piece"

class NullPiece < Piece
  include Singleton

  attr_reader :empty, :symbol

  def initialize
    @empty = true
    @symbol = ""
  end

  def color
    ""
  end

  def moves
    []
  end
end