require_relative 'square'
require_relative 'king'
require_relative 'knight'
require_relative 'bishop'
require_relative 'pawn'
require_relative 'piece'
require_relative 'queen'
require_relative 'rook'
require 'pry'

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
  puts "Would you like to add a piece? (Y/N)"
  new_piece = gets.chomp
  if new_piece.downcase == 'y'
    puts "On which row would you like to place the piece? (1-4)"
    row = gets.chomp.to_i
    if (1..4) === row
      puts "On what which square would you like to place the piece? (1-4)"
      column = gets.chomp.to_i
      if (1..4) === column
        selected_square = board.find  { |s| s.column == column and s.row == row}

        if selected_square.occupied == true
          puts "Unfortunately that square is currently occupied. Would you like to overwrite?"
          overwrite = gets.chomp.downcase
          if overwrite == 'y'
            deleted_piece = [pieces.find { |s| s.column == column and s.row == row }]
            pieces = pieces - deleted_piece
            puts "What type of piece is this? (K/Q/B/N/R/P)"
            piece = gets.chomp.upcase
            if ["K", "Q", "B", "N", "R", "P"].include?(piece)
              if piece == "K"
                pieces.push(King.new([column, row]))
              elsif piece == "Q"
                pieces.push(Queen.new([column, row]))
              elsif piece == "B"
                pieces.push(Bishop.new([column, row]))
              elsif piece == "N"
                pieces.push(Knight.new([column, row]))
              elsif piece == "Rook"
                pieces.push(Rook.new([column, row]))
              else
                pieces.push(Pawn.new([column, row]))
              end
            end
          end
        else
          puts "What type of piece is this? (K/Q/B/N/R/P)"
          piece = gets.chomp.upcase

          selected_square.occupied = true
          if ["K", "Q", "B", "N", "R", "P"].include?(piece)
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
          else
            puts "That is not a valid input. Please input one of K, Q, B, N, R, P"
          end
        end
      else
        puts "That is not a valid input. Please input an integer between 1 and 4"
      end
    else
      puts "That is not a valid input. Please input an integer between 1 and 4"
    end
  elsif new_piece.downcase == "n"
    board_input = false
  else
    puts "That is not a valid input. Please input 'y' or 's'"
  end
end

#App checks whether or not the board is solvable
possible_solves = pieces.permutation(pieces.length).to_a
possible_solves_master = possible_solves
possible_solves.each_with_index do |piece_array, index|
  piece_array.each_with_index do |piece, index|
    if piece_array[-1] != piece
      if piece_array.include?(piece) && piece.move([(piece_array[index + 1]).column, (piece_array[index + 1]).row])
        captured_piece = piece_array[index + 1]
        piece_array = piece_array.map do |x|
          if x == captured_piece
            piece
          else
            x
          end
        end
      end
    end
  end
end



solve_counter = 0
solve_array_keys = []
solutions = []
possible_solves.each_with_index do |piece_array, index|
  if piece_array[-1] == piece_array[-2]
    solve_counter = solve_counter + 1
    solve_array_keys.push(index)
  end
end
solve_array_keys.each do |key|
  solutions.push(possible_solves_master[key])
end
if solve_counter == 0 && pieces.length > 1
  puts "There are sadly no solutions to this puzzle."
elsif pieces.length == 1
  puts "There was only one piece, it is already solved."
else
  puts "There are #{solutions.length} solutions to this puzzle."
  puts "******************************"
  solutions.each do |solution|
    solution.each_with_index do |piece, index|
      unless solution[-1] == piece
        puts "The #{piece} takes the #{solution[index + 1]} at position #{solution[index + 1].location}."
      else
        puts "#{piece} is now the final piece."
      end
    end
  end
end
