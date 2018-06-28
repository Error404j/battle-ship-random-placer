
class ConsoleBoardRender

 def initialize(board)
  @board = board
 end

 def render_value(value)
  if value
    value.name[0].upcase
  else
    '.'
  end
 end

 def render
  puts ''
  size = @board.size - 1
  (0..size).each do |row|
    row_array = (0..size).map do |column|
      render_value(@board.get(row: row, column: column))
    end
    puts row_array.join(' ')
  end
  puts ''
 end

end