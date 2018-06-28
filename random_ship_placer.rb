
class RandomShipPlacer

  def initialize(board: nil, ship_placer: nil)
    @board = board
    @ship_placer = ship_placer
  end

  def place(ship)
    row = next_random_value(ship)
    column = next_random_value(ship)
    direction = get_random_direction()
    if @ship_placer.valid_placement_location?(start_row: row, start_column: column, ship: ship, direction: direction)
      @ship_placer.place(start_row: row, start_column: column, ship: ship, direction: direction)
    else
      place(ship)
    end
  end

  def next_random_value(ship)
    Random.rand( @board.max_possible_first_value(ship) + 1)
  end

  def get_random_direction()
    if Random.rand(2) == 1
      :vertical
    else
      :horizontal
    end
  end

end
