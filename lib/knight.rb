require_relative 'Piece'

class Knight < Piece
  def move(location)
    new_column = location[0]
    new_row = location[1]
    column_diff = new_column - @column
    row_diff = new_row - @row
    if (column_diff.abs == 2 && row_diff.abs == 1) || (column_diff.abs == 1 && row_diff.abs == 2)
      @column = new_column
      @row = new_row
      @location = [@column, @row]
    else
      false
    end
  end
end
