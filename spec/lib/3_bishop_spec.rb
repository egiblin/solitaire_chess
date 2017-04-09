require 'spec_helper'

describe Bishop do
  describe 'initialize' do
    it "creates a Bishop with location" do
      bishop = Bishop.new([2,2])

      expect(bishop).to be_truthy
    end
  end
  describe 'movement' do
    it "can move diagonally" do
      bishop = Bishop.new([2,2])

      expect(bishop.move([3,3])).to be_truthy
      expect(bishop.move([2,4])).to be_truthy
      expect(bishop.move([1,1])).to be_falsey
    end
  end
end
