# Solitaire Chess

Here's my work for the coding challenge of creating a game of Solitaire Chess. The main file for the program is chess.rb in the lib folder.

## Current Issues
So, the current set-up scales pretty poorly. The nested permutations means that over 5 or 6 pieces you end up having an absolutely monstrous amount of calculations that for, all intents and purposes, crash the program. Removing the nested permutations solves that issue, but that provides the problem that every solution is one where one piece is effectively the "capturer" that follows different move orders (and, unsurprisingly, cannot solve the example puzzle). Creating methods to make more stringent exclusions, and moving my valid-move/impediments? logic before the permutations, possibly with a recursive function where moves are just looked at move to move, e.g. [[Rook([2,2]), Bishop([3,3]), [Pawn([3,2]), Rook([2,2])]...], which would clearly cut down on calculations required and hopefully made a usable framework for avoiding the issue with a "capturer" piece that occured in my method.
