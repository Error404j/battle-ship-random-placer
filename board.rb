
class Board
  SIZE = 10
  BLANK_VALUE = nil
  OUT_OF_RANGE_MESSAGE = "row and column must be 0 to #{SIZE - 1}."

  def initialize
    @data = []
    SIZE.times do
      row = []
      SIZE.times { row << BLANK_VALUE }
      @data << row
    end
  end

  def is_blank?(row: 0, column: 0)
    validate_row_column(row: row, column: column)
    @data[row][column] == BLANK_VALUE
  end

  def set(row: 0, column: 0, value: BLANK_VALUE)
    validate_row_column(row: row, column: column)
    @data[row][column] = value
  end

  def get(row: 0, column: 0)
    validate_row_column(row: row, column: column)
    @data[row][column]
  end

  def max_possible_first_value(ship)
    SIZE - ship.length
  end

  def validate_row_column(row: 0, column: 0)
    raise OUT_OF_RANGE_MESSAGE if row >= SIZE || column >= SIZE || row < 0 || column < 0
  end

  def size
    SIZE
  end

end
