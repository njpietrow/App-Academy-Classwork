require "deck"
require "rspec"

describe Deck do
  subject(:deck) { Deck.new }
  let(:card) { double("card") }

  describe "#initialize" do 
    it "should have an array of cards" do
      expect(deck.cards).to be_an(Array)
    end

    it "should have 52 cards" do
      expect(deck.cards.length).to eq(52)
    end
    
  end
end