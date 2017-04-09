require 'spec_helper'

describe King do
  describe 'initialize' do
    it "creates a King with location" do
      king = King.new([1,1])

      expect(king).to be_truthy
    end
  end
  describe 'movement' do
    it "can move one square in any direction" do
      king = King.new([1,1])

      expect(king.move([2,2])).to be_truthy
      expect(king.move([3,2])).to be_truthy
      expect(king.move([3,1])).to be_truthy
      expect(king.move([4,2])).to be_truthy
      expect(king.move([4,4])).to be_falsey
      expect(king.move([2,2])).to be_falsey
    end
  end
end
