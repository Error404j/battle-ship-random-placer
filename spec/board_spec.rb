require './board'
require './ship'

RSpec.describe Board do

  subject { Board.new }
  let(:ship) { Ship.new(name: 'test') }

  context 'initialized board' do
    it 'is all blank' do
      Board::SIZE.times do |row|
        Board::SIZE.times do |column|
          expect( subject.is_blank?(row: row, column: column) ).to eq(true)
        end
      end
    end
  end

  context 'is_blank?' do
    let(:row) { 0 }
    let(:column) { 0 }

    it 'is true when not set' do
      expect( subject.is_blank?(row: row, column: column) ).to eq(true)
    end

    it 'is false when set' do
      subject.set(row: row, column: column, value: ship)
      expect( subject.is_blank?(row: row, column: column) ).to eq(false)
    end

    context 'when out of bounds' do
      let(:row) { Board::SIZE + 1 }
      let(:column) { Board::SIZE + 1 }

      it "too high raises #{Board::OUT_OF_RANGE_MESSAGE}" do
        expect{ subject.is_blank?(row: row, column: column) }.to raise_error(Board::OUT_OF_RANGE_MESSAGE)
      end

      it "too low raises #{Board::OUT_OF_RANGE_MESSAGE}" do
        expect{ subject.is_blank?(row: -1, column: -1) }.to raise_error(Board::OUT_OF_RANGE_MESSAGE)
      end
    end

  end

  context 'set' do
    let(:row) { 0 }
    let(:column) { 0 }

    it 'the value' do
      subject.set(row: row, column: column, value: ship)
      expect( subject.get(row: row, column: column) ).to eq(ship)
    end

    context 'when out of bounds' do
      let(:row) { Board::SIZE + 1 }
      let(:column) { Board::SIZE + 1 }

      it "too high raises #{Board::OUT_OF_RANGE_MESSAGE}" do
        expect{ subject.set(row: row, column: column, value: ship) }.to raise_error(Board::OUT_OF_RANGE_MESSAGE)
      end

      it "too low raises #{Board::OUT_OF_RANGE_MESSAGE}" do
        expect{ subject.set(row: -1, column: -1, value: ship) }.to raise_error(Board::OUT_OF_RANGE_MESSAGE)
      end
    end

  end

  context 'max_possible_first_value calculates' do
    let(:tug) { Ship.new(name: 'tug', length: 2) }
    let(:cruiser) { Ship.new(name: 'cruiser', length: 5) }

    it 'tug as 8' do
      expect( subject.max_possible_first_value(tug)).to eq(8)
    end

    it 'cruiser as 5' do
      expect( subject.max_possible_first_value(cruiser)).to eq(5)
    end
  end

end