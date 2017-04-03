require_relative 'Piece'

class Queen < Piece
  def move(location)
    new_column = location[0]
    new_row = location[1]
    if (new_column - @column) == (new_row - @row) || (new_column - @column) == (@row - new_row)
      @column = new_column
      @row = new_row
      @location = [@column, @row]
    elsif new_column == @column || new_row == @row
        @column = new_column
        @row = new_row
        @location = [@column, @row]
    else
      false
    end
  end
end
