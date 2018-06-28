require './ship'
require './ship_placer'

RSpec.describe ShipPlacer do

  let(:board) { Board.new }
  let(:tug) { Ship.new(name: 'tug', length: 2) }
  let(:cruiser) { Ship.new(name: 'cruiser', length: 5) }

  subject { ShipPlacer.new(board) }

  context 'valid_vertical_placement?', :justin do

    context 'cruiser start_row is' do

      it '0 is valid' do
        expect( subject.valid_vertical_placement?(start_row: 0, start_column: 0, ship: cruiser) ).to eq(true)
      end

      it '0 is invalid if any location has a ship' do
        board.set(row: 1, column: 0, value: tug)
        expect( subject.valid_vertical_placement?(start_row: 0, start_column: 0, ship: cruiser) ).to eq(false)
      end

      it '5 is valid' do
        expect( subject.valid_vertical_placement?(start_row: 5, start_column: 9, ship: cruiser) ).to eq(true)
      end


      it '6 is invalid' do
        expect( subject.valid_vertical_placement?(start_row: 6, start_column: 0, ship: cruiser) ).to eq(false)
      end

      it "0 but start column is 10 raises #{Board::OUT_OF_RANGE_MESSAGE}" do
        expect{ subject.valid_vertical_placement?(start_row: 0, start_column: 10, ship: cruiser) }.to raise_error(Board::OUT_OF_RANGE_MESSAGE)
      end

    end

    context 'tug start_row is' do

      it '0 is valid' do
        expect( subject.valid_vertical_placement?(start_row: 0, start_column: 0, ship: tug) ).to eq(true)
      end

      it '8 is valid' do
        expect( subject.valid_vertical_placement?(start_row: 8, start_column: 9, ship: tug) ).to eq(true)
      end


      it '9 is invalid' do
        expect( subject.valid_vertical_placement?(start_row: 9, start_column: 0, ship: tug) ).to eq(false)
      end

    end

  end

  context 'valid_horizontal_placement?' do

    context 'cruiser start_column is' do

      it '0 is valid' do
        expect( subject.valid_horizontal_placement?(start_row: 0, start_column: 0, ship: cruiser) ).to eq(true)
      end

      it '0 is invalid if any location has a ship' do
        board.set(row: 0, column: 3, value: tug)
        expect( subject.valid_horizontal_placement?(start_row: 0, start_column: 0, ship: cruiser) ).to eq(false)
      end

      it '5 is valid' do
        expect( subject.valid_horizontal_placement?(start_row: 9, start_column: 5, ship: cruiser) ).to eq(true)
      end

      it '6 is invalid' do
        expect( subject.valid_horizontal_placement?(start_row: 0, start_column: 6, ship: cruiser) ).to eq(false)
      end

      it "0 but start row is 10 raises #{Board::OUT_OF_RANGE_MESSAGE}" do
        expect{ subject.valid_horizontal_placement?(start_row: 10, start_column: 0, ship: cruiser) }.to raise_error(Board::OUT_OF_RANGE_MESSAGE)
      end

    end

    context 'tug start_column is' do

      it '0 is valid' do
        expect( subject.valid_horizontal_placement?(start_row: 0, start_column: 0, ship: tug) ).to eq(true)
      end

      it '8 is valid' do
        expect( subject.valid_horizontal_placement?(start_row: 9, start_column: 8, ship: tug) ).to eq(true)
      end

      it '9 is invalid' do
        expect( subject.valid_horizontal_placement?(start_row: 0, start_column: 9, ship: tug) ).to eq(false)
      end

    end

  end

  context 'valid_placement_location?' do
    context 'vertical' do

      context 'cruiser start_row is' do

        it '0 is valid' do
          expect( subject.valid_placement_location?(start_row: 0, start_column: 0, ship: cruiser, direction: :vertical) ).to eq(true)
        end

        it '5 is valid' do
          expect( subject.valid_placement_location?(start_row: 5, start_column: 9, ship: cruiser, direction: :vertical) ).to eq(true)
        end


        it '6 is invalid' do
          expect( subject.valid_placement_location?(start_row: 6, start_column: 0, ship: cruiser, direction: :vertical) ).to eq(false)
        end

        it "0 but start column is 10 raises #{Board::OUT_OF_RANGE_MESSAGE}" do
          expect{ subject.valid_placement_location?(start_row: 0, start_column: 10, ship: cruiser, direction: :vertical) }.to raise_error(Board::OUT_OF_RANGE_MESSAGE)
        end

      end

      context 'tug start_row is' do

        it '0 is valid' do
          expect( subject.valid_placement_location?(start_row: 0, start_column: 0, ship: tug, direction: :vertical) ).to eq(true)
        end

        it '8 is valid' do
          expect( subject.valid_placement_location?(start_row: 8, start_column: 9, ship: tug, direction: :vertical) ).to eq(true)
        end


        it '9 is invalid' do
          expect( subject.valid_placement_location?(start_row: 9, start_column: 0, ship: tug, direction: :vertical) ).to eq(false)
        end

      end
    end

    context 'horizontal' do

      context 'cruiser start_column is' do

        it '0 is valid' do
          expect( subject.valid_placement_location?(start_row: 0, start_column: 0, ship: cruiser, direction: :horizontal) ).to eq(true)
        end

        it '5 is valid' do
          expect( subject.valid_placement_location?(start_row: 9, start_column: 5, ship: cruiser, direction: :horizontal) ).to eq(true)
        end

        it '6 is invalid' do
          expect( subject.valid_placement_location?(start_row: 0, start_column: 6, ship: cruiser, direction: :horizontal) ).to eq(false)
        end

        it "0 but start row is 10 raises #{Board::OUT_OF_RANGE_MESSAGE}" do
          expect{ subject.valid_placement_location?(start_row: 10, start_column: 0, ship: cruiser, direction: :horizontal) }.to raise_error(Board::OUT_OF_RANGE_MESSAGE)
        end

      end

      context 'tug start_column is' do

        it '0 is valid' do
          expect( subject.valid_placement_location?(start_row: 0, start_column: 0, ship: tug, direction: :horizontal) ).to eq(true)
        end

        it '8 is valid' do
          expect( subject.valid_placement_location?(start_row: 9, start_column: 8, ship: tug, direction: :horizontal) ).to eq(true)
        end

        it '9 is invalid' do
          expect( subject.valid_placement_location?(start_row: 0, start_column: 9, ship: tug, direction: :horizontal) ).to eq(false)
        end

      end

    end

  end

  context 'place' do
    it 'horizontal places ship' do
      subject.place(start_row: 1, start_column: 0, ship: cruiser, direction: :horizontal)
      expect(board.get(row: 1, column: 0)).to eq(cruiser)
      expect(board.get(row: 1, column: 1)).to eq(cruiser)
      expect(board.get(row: 1, column: 2)).to eq(cruiser)
      expect(board.get(row: 1, column: 3)).to eq(cruiser)
      expect(board.get(row: 1, column: 4)).to eq(cruiser)
      expect(board.get(row: 1, column: 5)).to be_nil
    end

    it 'vertical places ship' do
      subject.place(start_row: 3, start_column: 2, ship: cruiser, direction: :vertical)
      expect(board.get(row: 3, column: 2)).to eq(cruiser)
      expect(board.get(row: 4, column: 2)).to eq(cruiser)
      expect(board.get(row: 5, column: 2)).to eq(cruiser)
      expect(board.get(row: 6, column: 2)).to eq(cruiser)
      expect(board.get(row: 7, column: 2)).to eq(cruiser)
      expect(board.get(row: 8, column: 2)).to be_nil
    end


  end

end
