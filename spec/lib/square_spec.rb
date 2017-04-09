require 'spec_helper'

describe Square do
  describe 'initialize' do
    it "creates a square with location" do
      square = Square.new([2,2])

      expect(square).to be_truthy
    end
  end
  describe 'occupied' do
    it 'determines whether or not a square is occupied' do
      empty_square = Square.new([2,2])
      occupied_square = Square.new([2,2])

      occupied_square.occupied = true

      expect(empty_square.occupied).to eq(false)
      expect(occupied_square.occupied).to eq(true)
    end
  end

  describe 'piece' do
    it 'returns the piece on an occupied square' do
      empty_square = Square.new([2,2])
      occupied_square = Square.new([2,2])
      occupied_square.occupied = true
      king = King.new([2,2])
      occupied_square.piece = king

      expect(empty_square.piece).to be_falsey
      expect(occupied_square.piece).to eq(king)
    end
  end
end
