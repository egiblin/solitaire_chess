class Piece
  attr_reader :column, :row, :location

  def initialize(location)
    @location = location
    @column = location[0]
    @row = location[1]
  end

  def impediments?(location, board)
    false
  end

end
