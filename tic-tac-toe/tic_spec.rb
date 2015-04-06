require_relative 'tic_tac_toe'

describe 'TicTacToe' do 
  let(:game){ TicTacToe.new }
	
  describe 'models' do
    it 'should return the false for a winner' do
      expect(game.winner).to be false
    end

    # it 'should return the winning combos' do
    #   # need to look up how to check constants in rspec
    #   expect(game.WINNING_COMBOS).to eq([[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]])
    # end

     
    it 'should create a new game board' do 
      expect(game.game_board).to be_a Hash
    end
  end

  # pending 'display_board' do
  #   # look up rspec stdout to see how to test this
  #   it 'should diplay the game board' do
  #     expect(game.display_board).to be_a String
  #   end
  # end

  describe 'game_over?' do
    it 'should return false for a winner' do 
      expect(game.winner).to be false
    end


    it 'should return true for winner' do
      game.game_board = {1 => "X", 2 => "X", 3 => "X",
                         4 => " ", 5 => " ", 6 => " ",
                         7 => " ", 8 => " ", 9 => " "}
      game.game_over?     
      expect(game.winner).to be true
    end

    it 'should return true for winner' do
      game.game_board = {1 => "O", 2 => " ", 3 => " ",
                         4 => "O", 5 => " ", 6 => " ",
                         7 => "O", 8 => " ", 9 => " "}
      game.game_over?     
      expect(game.winner).to be true
    end

    it 'should return true for winner' do
      game.game_board = {1 => "X", 2 => " ", 3 => " ",
                         4 => " ", 5 => "X", 6 => " ",
                         7 => " ", 8 => " ", 9 => "X"}
      game.game_over?     
      expect(game.winner).to be true
    end

    it 'should return true for winner' do
      game.game_board = {1 => " ", 2 => " ", 3 => "O",
                         4 => " ", 5 => "O", 6 => " ",
                         7 => "O", 8 => " ", 9 => " "}
      game.game_over?     
      expect(game.winner).to be true
    end

    it 'should return false for a winner' do
      game.game_board = {1 => "X", 2 => "O", 3 => "O",
                         4 => "O", 5 => "X", 6 => "X",
                         7 => "O", 8 => "X", 9 => "O"}
      game.game_over?  
      expect(game.winner).to be false
    end           
  end

end