require 'spec_helper'

describe Pawn do
  describe 'initialize' do
    it "creates a Pawn with location" do
      pawn = Pawn.new([2,2])

      expect(pawn).to be_truthy
    end
  end
  describe 'movement' do
    it "can move one square diagonally downboard" do
      pawn = Pawn.new([2,2])

      expect(pawn.move([3,3])).to be_truthy
      expect(pawn.move([2,4])).to be_truthy
      expect(pawn.move([1,3])).to be_falsey
    end
  end
end
