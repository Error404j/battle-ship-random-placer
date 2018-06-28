require './board'
require './ship'
require './console_board_render'

RSpec.describe ConsoleBoardRender do

  let(:board) { Board.new }
  let(:tug) { Ship.new(name: 'tug', length: 2) }
  let(:cruiser) { Ship.new(name: 'cruiser', length: 5) }

  subject { ConsoleBoardRender.new(board) }

  context 'render_value' do
    it 'nil is .' do
      expect(subject.render_value(nil)).to eq('.')
    end

    it 'cruiser is C' do
      expect(subject.render_value(cruiser)).to eq('C')
    end

    it 'tug is T' do
      expect(subject.render_value(tug)).to eq('T')
    end
  end

end
