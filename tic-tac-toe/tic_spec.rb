require_relative 'tic_tac_toe'

describe 'TicTacToe' do 
  let(:game){ TicTacToe.new }
	
  it 'should return the ' do

  end

  describe 'create_board' do 
    it 'should create a new game board' do 
      expect(game.game_board).to be_a Hash
    end
  end

  pending 'display_board' do
    # need to change puts to p on line 37
    it 'should diplay the game board' do
      expect(game.display_board).to be_a String
    end
  end

end