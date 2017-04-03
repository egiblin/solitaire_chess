require_relative 'Piece'

class Pawn < Piece
  def move(location)
    new_column = location[0]
    new_row = location[1]
    if (new_row - @row) == 1 && ((new_column - @column)== -1 || (new_column - @column)==1)
      @column = new_column
      @row = new_row
      @location = [@column, @row]
    else
      false
    end
  end
end
