
class ShipPlacer

  def initialize(board)
    @board = board
  end

  def place(start_row: 0, start_column: 0, ship: nil, direction: :horizontal )
    if(valid_placement_location?(start_row: start_row, start_column: start_column, ship: ship, direction: direction ))
      generate_locations(start_row: start_row, start_column: start_column, ship: ship, direction: direction ) do |row, column|
        @board.set(row: row, column: column, value: ship)
      end
    end
  end

  def valid_placement_location?(start_row: 0, start_column: 0, ship: nil, direction: :horizontal )
    @board.validate_row_column(row: start_row, column: start_column)
    valid = false
    if direction == :vertical
      valid = valid_vertical_placement?(start_row: start_row, start_column: start_column, ship: ship)
    else
      valid = valid_horizontal_placement?(start_row: start_row, start_column: start_column, ship: ship)
    end
    valid
  end

  def valid_vertical_placement?(start_row: 0, start_column: 0, ship: nil)
    valid = false
    max_start = @board.max_possible_first_value(ship)
    if start_row <= max_start
      valid = true
      generate_vertical_locations(start_row: start_row, start_column: start_column, ship: ship) do |row, column|
        unless @board.is_blank?(row: row, column: column)
          valid = false
          break;
        end
      end
    end
    valid
  end

  def valid_horizontal_placement?(start_row: 0, start_column: 0, ship: nil)
    valid = false
    max_start = @board.max_possible_first_value(ship)
    if start_column <= max_start
      valid = true
      generate_horizontal_locations(start_row: start_row, start_column: start_column, ship: ship) do |row, column|
        unless @board.is_blank?(row: row, column: column)
          valid = false
          break;
        end
      end
    end
    valid
  end



  private

    def generate_locations(start_row: 0, start_column: 0, ship: nil, direction: :horizontal)
      if direction == :vertical
        generate_vertical_locations(start_row: start_row, start_column: start_column, ship: ship) { |row, column| yield(row, column) }
      else
        generate_horizontal_locations(start_row: start_row, start_column: start_column, ship: ship) { |row, column| yield(row, column) }
      end
    end

    def generate_vertical_locations(start_row: 0, start_column: 0, ship: nil)
      ship_end = start_row + ship.length - 1;
      (start_row..ship_end).each do |row|
        yield(row, start_column)
      end
    end

    def generate_horizontal_locations(start_row: 0, start_column: 0, ship: nil)
      ship_end = start_column + ship.length - 1;
      (start_column..ship_end).each do |column|
        yield(start_row, column)
      end
    end

end
