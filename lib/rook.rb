require_relative 'Piece'

class Rook < Piece
  def move(location)
    new_column = location[0]
    new_row = location[1]
    if new_column == @column || new_row == @row
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
    if new_column == @column
      if (new_row - @row) > 1
        squares = board.find_all {|s| s.row == @row and s.row > @row and s.row < new_row}
        squares.sort! {|s| (s.row - @row).abs}
        squares.each do |square|
          if square.occupied
            return square
          end
        end
        false
      elsif (new_row - @row) < -1
        squares = board.find_all {|s| s.row == @row and s.row < @row and s.row > new_row}
        squares.sort! {|s| (s.row - @row).abs}
        squares.each do |square|
          if square.occupied
            return square
          end
        end
        false
      else
        false
      end
    elsif new_row == @row
      if (new_column - @column) > 1
        squares = board.find_all {|s| s.row == @row and s.column > @column and s.column < new_column}
        squares.sort! {|s| (s.column - @column).abs}
        squares.each do |square|
          if square.occupied
            return square
          end
        end
        false
      elsif (new_column - @column) < -1
        squares = board.find_all {|s| s.row == @row and s.column < @column and s.column > new_column}
        squares.sort! {|s| (s.column - @column).abs}
        squares.each do |square|
          if square.occupied
            return square
          end
        end
        false
      else
        false
      end
    else
      false
    end
  end
end
