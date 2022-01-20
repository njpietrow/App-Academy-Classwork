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
      it "adds unique elements" do 
        expect(array.two_sum).to_not include([1,1])
      end
      context "if array is empty" do
        it "returns an empty array" do
          expect([].two_sum).to eq([])
        end
      end
  end

  describe "#my_transpose" do 
    let(:array) {[[0, 1, 2], [3, 4, 5], [6, 7, 8]]} 
    let(:tranposed) {[[0, 3, 6], [1, 4, 7], [2, 5, 8]]}
    it "returns tranposed array" do 
      expect(my_transpose(array)).to eq(tranposed)
    end
    it "returns the same amount of sub_arrays" do 
      expect(my_transpose(array).length).to eq(tranposed.length)
    end 
    it "throws an error if the array is not square" do 
      expect {my_transpose([[2],[1]])}.to raise_error("Array is not square")
    end
    it "does not modify orginal array" do 
      expect(my_transpose(array)).to_not be(array)
      expect(array).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
    end
  end

  describe "#stock_picker" do
    let(:stocks) {[12, 10, 10, 6, 9, 1, 3, 6, 10, 4, 2, 11]}

    it "returns the buy and sell indices with largest profit" do
      expect(stock_picker(stocks)).to eq([5,11])
    end

    it "returns a sell index that appears after the buy index" do 
      expect(stock_picker(stocks)[0]).to be <= stock_picker(stocks)[1]
    end

    it "throws an error when called with something other than an array" do
      expect {stock_picker("hi mom")}.to raise_error("Please pass in an array")
    end
  end
end