require_relative 'Piece'

class King < Piece
  def move(location)
    new_column = location[0]
    new_row = location[1]
    if (new_column - @column).between?(-1,1) && (new_row - @row).between?(-1,1)
      @column = new_column
      @row = new_row
      @location = [@column, @row]
    else
      false
    end
  end
end
