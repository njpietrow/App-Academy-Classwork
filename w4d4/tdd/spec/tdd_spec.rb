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

  describe "Towers of Hanoi" do 
    let(:towers){Towers.new}

    describe "#initialize" do 
      it "creates initial stack of disks of height 4" do 
        expect(towers.stacks[0].length).to eq(4)
      end
      it "make second and third stacks empty" do 
        expect(towers.stacks[1]).to be_empty
        expect(towers.stacks[2]).to be_empty
      end
      it "should not make more than three stacks" do 
        expect(towers.stacks.length).to eq(3)
      end
    end

    describe "#move" do
      before(:each) {towers.move(0,2)}
      it "moves a disk from one stack to another" do 
        expect(towers.stacks[2]).to_not be_empty 
        expect(towers.stacks[1]).to be_empty
        expect(towers.stacks[0].length).to eq(3)
      end 
      it "moves top disk from one stack to another" do 
        expect(towers.stacks[2][-1]).to eq(0)
        expect(towers.stacks[0][-1]).to eq(1)
      end
      it "does not put bigger disk on top of smaller disk" do
        towers.move(0,2)
        expect(towers.stacks[2][-1]).to eq(0) 
        expect(towers.stacks[0][-1]).to eq(1)
      end
      it "returns message if start position is empty" do
        expect(towers.move(1,0)).to eq("Empty start position")
      end

    end

    describe "#won?" do
      it "should return true if game won" do
        towers.stacks[0], towers.stacks[2] = towers.stacks[2], towers.stacks[0]
        expect(towers.won?).to be true
      end
      it "should return false if game is not won" do
        expect(towers.won?).to be false
      end
    end
  end
end