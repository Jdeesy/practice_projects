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
  require 'Display'
  attr_accessor :game_board, :winner
  attr_reader :WINNING_COMBOS
  WINNING_COMBOS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

  def initialize
    @game_board = {1 => " ", 2 => " ", 3 => " ",
                   4 => " ", 5 => " ", 6 => " ",
                   7 => " ", 8 => " ", 9 => " "}
    @players = ["X","O"]
    @winner = false

    welcome
  end

  def game_controller
    display_board
    until @winner == true
      @players.each do |player|
        game_over?
        empty_cell = false
        break if @winner == true


        while empty_cell == false
          puts "#{player}'s please select a cell"
          player_input = gets.chomp.downcase

          case player_input
          when "exit", "quit", "q"
            exit_message
            answer = gets.chomp.downcase
            abort if answer == "y" || answer == "yes"
          when /\A[1-9]\z/
            if @game_board[player_input.to_i] == " "
              game_board[player_input.to_i] = "#{player}"
              empty_cell = true
              display_current_board
            else
              cell_taken
              display_current_board
            end
          else
            unknown_command
            display_board
            display_current_board
          end
        end
      end
    end
  end

  def game_over?
    WINNING_COMBOS.each do |combo|
      winning_array = []
      combo.each { |cell| winning_array << game_board[cell] }
      if winning_array.all? { |x| x.upcase == "X" }
        puts "The winner is X!"
        @winner = true
      elsif winning_array.all? { |o| o.upcase == "O"}
        puts "The winner is O!"
        @winner = true
      end
    end
  end
end

module Display
  def self.welcome
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

  def self.display_board
    puts "1|2|3\n-----\n4|5|6\n-----\n7|8|9\n\n"
  end

  def self.display_current_board
    puts "#{game_board[1]}|#{game_board[2]}|#{game_board[3]}\n-----\n#{game_board[4]}|#{game_board[5]}|#{game_board[6]}\n-----\n#{game_board[7]}|#{game_board[8]}|#{game_board[9]}"
  end

  def self.cell_taken
    puts "I am sorry but that cell already has an X or O. Please select again."
  end

  def self.unknown_command
    puts "Sorry I don't recognize that command. Please try again."
  end

  def self.exit_message 
    puts "Are you sure you want to quit? (y/n)"
  end
end

game = TicTacToe.new
game.game_controller