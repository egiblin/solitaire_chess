require 'pry'
class Square
  attr_reader :column, :row, :location
  attr_accessor :occupied, :piece

  def initialize(location)
    @column = location[0]
    @row = location[1]
    @location = location
    @occupied = false
    @piece = ''
  end
end
