require 'spec_helper'

describe Rook do
  describe 'initialize' do
    it "creates a Rook with location" do
      rook = Rook.new([2,2])

      expect(rook).to be_truthy
    end
  end
  describe 'movement' do
    it "can move vertically and horizontally" do
      rook = Rook.new([2,2])

      expect(rook.move([3,3])).to be_falsey
      expect(rook.move([2,4])).to be_truthy
      expect(rook.move([1,3])).to be_falsey
      expect(rook.move([3,4])).to be_truthy
    end
  end
end
