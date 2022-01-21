require "card"
require "rspec"

describe Card do
  subject(:card) {Card.new(5,"Heart")}
  describe "#initialize" do
    it "should set a value instance variable" do
      expect(card.value).to eq(5)
    end

    it "should set a suit instance variable" do
      expect(card.suit).to eq("Heart")
    end
  end
end