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

  def initialize
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
  
  def create_board
    @game_board = Array.new(3, Array.new(3)) 
  end

  def display_board
    @game_board.each { |row| p row }
  end

  def game_controller
    until winner?
      @players.each do |player|
        empty_cell = false

        while empty_cell = false
          puts "#{player}'s please select a row"
          row = gets.chomp.to_i + 1
          puts "Now select a column"
          column = gets.chomp.to_i + 1

          if @game_board[row][column] = nil
            @game_board[row][column] = player
            empty_cell = true
          else
            puts "I am sorry but that cell already has an X or O. Please select again."
          end
        end
      end
    end
  end

  def winner?

  end
end

game = TicTacToe.new
game.create_board
#game.display_board