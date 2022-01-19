require "singleton"
require_relative "piece"

class NullPiece < Piece
  include Singleton

  attr_reader :symbol

  def initialize
    @symbol = " "
  end

  def color
    ""
  end

  def moves
    []
  end

  def empty?
    true
  end
end