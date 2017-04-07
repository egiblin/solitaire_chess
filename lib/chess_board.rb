require_relative 'square'

def chess_board(squares, pieces)
  pieces.each do |piece|
    location = squares.select {|s| s.location == piece.location}
    location.first.piece = piece.class
  end
  squares.each do |square|
    if square.piece == King
      square.symbol = "K"
    elsif square.piece == Queen
      square.symbol = "Q"
    elsif square.piece == Bishop
      square.symbol = "B"
    elsif square.piece == Knight
      square.symbol = "N"
    elsif square.piece == Rook
      square.symbol = "R"
    elsif square.piece == Pawn
      square.symbol = "P"
    end
  end
  row_counter = 1
  4.times do
    row = squares.select {|s| s.row == row_counter}
    row.sort_by! {|r| r.column}
    row.each do |square|
      print square.symbol
    end
    row_counter = row_counter + 1
    puts ""
  end
end
