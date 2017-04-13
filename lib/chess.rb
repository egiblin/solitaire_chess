require_relative 'square'
require_relative 'king'
require_relative 'knight'
require_relative 'bishop'
require_relative 'pawn'
require_relative 'piece'
require_relative 'queen'
require_relative 'rook'
require_relative 'chess_board'

#initialize boards
board = []
column_counter = 1
row_counter = 1
4.times do
  4.times do
    board.push(Square.new([column_counter, row_counter]))
    column_counter = column_counter + 1
  end
  row_counter = row_counter + 1
  column_counter = 1
end

#Player inputs Pieces
pieces = []

puts "Welcome to Solitaire Chess! You currently have an empty board.
Please place your pieces."
puts "Pieces are denoted by the following letters: "
puts "King: K"
puts "Queen: Q"
puts "Bishop: B"
puts "Knight: N"
puts "Rook: R"
puts "Pawn: P"
puts ""
puts "To place at a certain location, please give the with the top row being first.
 Please remember pawns may only move downboard"
puts "After row, give the square, with 1 being on the left and 4 on the right."
puts "Finally, give the piece type."
board_input = true
while board_input do
  chess_board(board, pieces)
  puts "Would you like to add a piece? (Y/N)"
  new_piece = gets.chomp
  if new_piece.downcase == 'y'
    puts "On which row would you like to place the piece? (1-4)"
    row = gets.chomp.to_i
    while row.between?(1,4) == false
      puts "That is not a valid input. Please input an integer between 1 and 4"
      row = gets.chomp.to_i
    end
    puts "On what which square would you like to place the piece? (1-4)"
    column = gets.chomp.to_i
    while column.between?(1,4) == false
      puts "That is not a valid input. Please input an integer between 1 and 4"
      column = gets.chomp.to_i
    end
    selected_square = board.find  { |s| s.column == column and s.row == row}
    if selected_square.occupied == true
      puts "Unfortunately that square is currently occupied. Would you like to overwrite?"
      overwrite = gets.chomp.downcase
      while overwrite != 'y' && overwrite != 'n'
        puts "That is not a valid input. Please put 'y' or 'n'"
        overwrite = gets.chomp.downcase
      end
      if overwrite == 'y'
        deleted_piece = [pieces.find { |s| s.column == column and s.row == row }]
        pieces = pieces - deleted_piece
        puts "What type of piece is this? (K/Q/B/N/R/P)"
        piece = gets.chomp.upcase
        while ["K", "Q", "B", "N", "R", "P"].include?(piece) == false
          puts "That is not a valid piece. Please enter one of (K/Q/B/N/R/P)"
          piece = gets.chomp.upcase
        end
        if piece == "K"
          pieces.push(King.new([column, row]))
        elsif piece == "Q"
          pieces.push(Queen.new([column, row]))
        elsif piece == "B"
          pieces.push(Bishop.new([column, row]))
        elsif piece == "N"
          pieces.push(Knight.new([column, row]))
        elsif piece == "R"
          pieces.push(Rook.new([column, row]))
        else
          pieces.push(Pawn.new([column, row]))
        end
      end
    else
      selected_square.occupied = true
      puts "What type of piece is this? (K/Q/B/N/R/P)"
      piece = gets.chomp.upcase
      while ["K", "Q", "B", "N", "R", "P"].include?(piece) == false
        puts "That is not a valid piece. Please enter one of (K/Q/B/N/R/P)"
        piece = gets.chomp.upcase
      end
      if piece == "K"
        pieces.push(King.new([column, row]))
      elsif piece == "Q"
        pieces.push(Queen.new([column, row]))
      elsif piece == "B"
        pieces.push(Bishop.new([column, row]))
      elsif piece == "N"
        pieces.push(Knight.new([column, row]))
      elsif piece == "R"
        pieces.push(Rook.new([column, row]))
      else
        pieces.push(Pawn.new([column, row]))
      end
    end
  elsif new_piece.downcase == "n"
    board_input = false
  else
    puts "That is not a valid input. Please input 'y' or 's'"
  end
end

#Method to check each permutation of move orders
def solution_checker(array)
  if array.length > 1
    # Create a board that can be manipulated without affecting the original board
    internal_board = []
    column_counter = 1
    row_counter = 1
    4.times do
      4.times do
        internal_board.push(Square.new([column_counter, row_counter]))
        column_counter = column_counter + 1
      end
      row_counter = row_counter + 1
      column_counter = 1
    end
    #Label squares on the board as occupied
    array.each do |piece|
      square = internal_board.find {|s| s.location == piece.location}
      square.occupied = true
      square.piece = piece
    end
    array.each_with_index do |piece, index|
      if array.include?(piece) && piece != array.last
        original_square = internal_board.find {|s| s.location == piece.location}
        blocker = piece.impediments?([(array[index + 1]).column, (array[index + 1]).row], internal_board)
        if blocker
          break
        elsif piece.move([(array[index + 1]).column, (array[index + 1]).row])
          captured_piece = array[index + 1]
          array.uniq!{|piece| piece.location}
          original_square.occupied = false
          original_square.piece = nil
          new_moves = array.permutation.to_a
          new_moves.each do |new_array|
            new_array.map {|a| a.dup}
          end
          new_moves.each do |new_array|
            solution_checker(array)
          end
        else
          break
        end
      else
        break
      end
    end
  end
end


#App checks whether or not the board is solvable
possible_solves = pieces.permutation(pieces.length).to_a
possible_solves.each do |piece_array|
  piece_array.map! {|piece| piece.dup}
end
possible_solves.each do |piece_array|
  solution_checker(piece_array)
end
solve_counter = 0
solve_array_keys = []
solutions = []
possible_solves.each_with_index do |piece_array, index|
  if piece_array.length == 1
    solve_counter = solve_counter + 1
    solve_array_keys.push(index)
  end
end
possible_solves_master = pieces.permutation(pieces.length).to_a
solve_array_keys.each do |key|
  solutions.push(possible_solves_master[key])
end
if solve_counter == 0 && pieces.length > 1
  puts "There are sadly no solutions to this puzzle."
elsif pieces.length == 1
  puts "There was only one piece, it is already solved."
else
  puts "******************************"
  puts "There are #{solutions.length} solutions to this puzzle."
  puts "******************************"
  solutions.each_with_index do |solution, i|
    puts "Solution #{i + 1}:"
    solution.each_with_index do |piece, index|
      unless solution.last == piece
        puts "The #{solution.first.class} takes the #{solution[index + 1].class} at position #{solution[index + 1].location}."
      else
        puts "#{solution.first.class} is now the final piece."
        puts "****************************"
      end
    end
  end
end
