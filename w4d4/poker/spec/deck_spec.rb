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

  describe "#shuffle!" do 
    it "shuffles cards in deck" do
      previous_state = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).to_not eq(previous_state)
    end
  end

end