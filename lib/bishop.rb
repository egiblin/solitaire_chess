require_relative 'Piece'

class Bishop < Piece
  def move(location)
    new_column = location[0]
    new_row = location[1]
    if (new_column - @column) == (new_row - @row) || (new_column - @column) == (@row - new_row)
      @column = new_column
      @row = new_row
      @location = [@column, @row]
    else
      false
    end
  end

  def impedements?(location, board)
    new_column = location[0]
    new_row = location[1]
    if (new_column - @column) > 0 && (new_row - @row) > 0
      new_column = new_column + 1
      new_row = new_row + 1
      while new_column != @column || new_row != @row
        square = board.find {|s| s.row == new_row and s.column == new_column}
        if square.occupied
          return square
        else
          new_column = new_column + 1
          new_row = new_row + 1
        end
      end
      false
    elsif (new_column - @column) < 0 && (new_row - @row) > 0
      new_column = new_column - 1
      new_row = new_row + 1
      while new_column != @column || new_row != @row
        square = board.find {|s| s.row == new_row and s.column == new_column}
        if square.occupied
          return square
        else
          new_column = new_column - 1
          new_row = new_row + 1
        end
      end
      false
    elsif (new_column - @column) > 0 && (new_row - @row) < 0
      new_column = new_column + 1
      new_row = new_row - 1
      while new_column != @column || new_row != @row
        square = board.find {|s| s.row == new_row and s.column == new_column}
        if square.occupied
          return square
        else
          new_column = new_column + 1
          new_row = new_row - 1
        end
      end
      false
    elsif (new_column - @column) < 0 && (new_row - @row) < 0
      new_column = new_column - 1
      new_row = new_row - 1
      while new_column != @column || new_row != @row
        square = board.find {|s| s.row == new_row and s.column == new_column}
        if square.occupied
          return square
        else
          new_column = new_column - 1
          new_row = new_row - 1
        end
      end
      false
    else
      false
    end
  end

end
