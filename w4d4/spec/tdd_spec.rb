require "tdd"
require "rspec"

describe "TDD Tests" do 
  describe "#my_uniq" do
    let(:array) {[1, 2, 1, 3, 3]}
    it "removes duplicates from an array" do
        expect(my_uniq(array)).to eq([1, 2, 3])
    end
  end

  describe "Array#two_sum" do 
    let(:array) {[-1, 0, 2, -2, 1]}
      it "returns indices of pairs that sum to zero" do
        expect(array.two_sum).to eq([[0, 4], [2, 3]])
      end
      context "if array is empty" do
        it "returns an empty array" do
          expect([].two_sum).to eq([])
        end
      end
  end
end