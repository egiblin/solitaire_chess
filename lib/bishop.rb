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

  def impediments?(location, board)
    new_column = location[0]
    new_row = location[1]
    if (new_column - @column) > 0 && (new_row - @row) > 0
      path_column = @column + 1
      path_row = @row + 1
      while (path_column - new_column).abs > 1 || (path_row - new_row).abs > 1
        square = board.find {|s| s.row == path_row and s.column == path_column}
        if square.occupied
          return true
        else
          path_column += 1
          path_row += 1
        end
      end
      false
    elsif (new_column - @column) < 0 && (new_row - @row) > 0
      path_column = @column - 1
      path_row = @row + 1
      while (path_column - new_column).abs > 1 || (path_row - new_row).abs > 1
        square = board.find {|s| s.row == path_row and s.column == path_column}
        if square.occupied
          return true
        else
          path_column -= 1
          path_row += 1
        end
      end
      false
    elsif (new_column - @column) > 0 && (new_row - @row) < 0
      path_column = @column + 1
      path_row = @row - 1
      while (path_column - new_column).abs > 1 || (path_row - new_row).abs > 1
        square = board.find {|s| s.row == path_row and s.column == path_column}
        if square.occupied
          return true
        else
          path_column += 1
          path_row -= 1
        end
      end
      false
    elsif (new_column - @column) < 0 && (new_row - @row) < 0
      path_column = @column - 1
      path_row = @row - 1
      while (path_column - new_column).abs > 1 || (path_row - new_row).abs > 1
        square = board.find {|s| s.row == path_row and s.column == path_column}
        if square.occupied
          return true
        else
          path_column -= 1
          path_row -= 1
        end
      end
      false
    else
      false
    end
  end

end
