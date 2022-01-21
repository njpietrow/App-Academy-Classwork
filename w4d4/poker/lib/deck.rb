require_relative "card"

class Deck

  attr_reader :cards

  def initialize
    @cards = []
    fill_cards
  end


  private 
  def fill_cards 
    suits = %w(Hearts Spades Clubs Diamonds)

    suits.each do |suit|
      (2..14).each do |value|
        cards << Card.new(value, suit)
      end
    end

  end

end