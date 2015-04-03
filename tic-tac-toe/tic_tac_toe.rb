##############################################################################
# Pseudocode
# -MVP-
# we need to make a class called TicTacToe
# in initialize we will tell the players to pick heads or tails
# we will then randomly pick heads/tails and whoever got it right goes first
# the first player will be X's and the other player is O's
# create a game board
# allow the players to select a cell to add an X or O
# checks if a player has 3 in a row
# if they do they win
# othewise game continues
# if there are no more cells to select from and no one has one,
# end game with a tie
##############################################################################


class TicTacToe
  attr_accessor :game_board
  WINNING_COMBOS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,9]]

  def initialize
    @game_board = {1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " "}
    @players = ["X","O"]

    puts "Welcome to Tic-Tac-Toe!"
    puts "To begin, someone needs to pick Heads or Tails"
    puts "The program will do a coin toss and"
    puts "whoever gets it wins this coin toss will go first"
    puts "PRESS ENTER WHEN READY"
    gets
    coin_toss = ["Heads","Tails"].sample
    puts "#{coin_toss} goes first"
    puts
  end
  
  def display_board
    puts "1|2|3\n-----\n4|5|6\n-----\n7|8|9\n\n"
  end

  def display_current_board
     puts "#{game_board[1]}|#{game_board[2]}|#{game_board[3]}\n-----\n#{game_board[4]}|#{game_board[5]}|#{game_board[6]}\n-----\n#{game_board[7]}|#{game_board[8]}|#{game_board[9]}"
  end

  def game_controller
    until winner?
      @players.each do |player|
        empty_cell = false
        display_board
        display_current_board

        while empty_cell == false
          puts "#{player}'s please select a cell"
          cell = gets.chomp.downcase

          if cell == "exit" || cell == "q" || cell == "quit"
            abort
          elsif cell.to_i != 0
            if @game_board[cell.to_i] == " "
              game_board[cell.to_i] = "#{player}"
              empty_cell = true
            else
              puts "I am sorry but that cell already has an X or O. Please select again."
              display_current_board
            end
          else
            puts "Sorry I don't reconize that command. Please try again."
            display_current_board
          end
        end
      end
    end
  end

  def winner?
    false
  end

  def to_s
    "#{game_board[1]}|#{game_board[2]}|#{game_board[3]}\n-----\n#{game_board[4]}|#{game_board[5]}|#{game_board[6]}\n-----\n#{game_board[7]}|#{game_board[8]}|#{game_board[9]}"
  end
end

game = TicTacToe.new
game.game_controller