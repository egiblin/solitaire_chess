require 'spec_helper'

describe Knight do
  describe 'initialize' do
    it "creates a Knight with location" do
      knight = Knight.new([2,2])

      expect(knight).to be_truthy
    end
  end
  describe 'movement' do
    it "can move in a L-pattern" do
      knight = Knight.new([2,2])

      expect(knight.move([3,3])).to be_falsey
      expect(knight.move([3,4])).to be_truthy
      expect(knight.move([1,3])).to be_truthy
      expect(knight.move([3,2])).to be_truthy
      expect(knight.move([3,4])).to be_falsey
    end
  end
end
