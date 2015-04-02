require_relative 'tic_tac_toe'

describe 'TicTacToe' do 
  let(:game){ TicTacToe.new }
	
  describe 'create_board' do 
    it 'should create a new game board' do 
      expect(game.create_board.class).to be(Array)
    end
  end

  describe 'display_board' do
    it 'should diplay the game board' do
      game.create_board 
      expect(game.display_board).to eq([[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]])
    end
  end

end