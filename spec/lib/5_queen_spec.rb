require 'spec_helper'

describe Queen do
  describe 'initialize' do
    it "creates a Queen with location" do
      queen = Queen.new([1,1])

      expect(queen).to be_truthy
    end
  end
  describe 'movement' do
    it "can move vertically, horizontally, diagonally" do
      queen = Queen.new([1,1])

      expect(queen.move([2,2])).to be_truthy
      expect(queen.move([4,2])).to be_truthy
      expect(queen.move([4,4])).to be_truthy
      expect(queen.move([1,3])).to be_falsey
      expect(queen.move([2,2])).to be_truthy
    end
  end
end
