require './ship'
require './ship_placer'
require './board'
require './random_ship_placer'
require './console_board_render'

tug = Ship.new(name: 'Tug', length: 2)
destroyer = Ship.new(name: 'Destroyer', length: 3)
submarine = Ship.new(name: 'Submarine', length: 3)
battleship = Ship.new(name: 'Battleship', length: 4)
cruiser = Ship.new(name: 'Cruiser', length: 5)

board = Board.new
ship_placer = ShipPlacer.new(board)
random_ship_placer = RandomShipPlacer.new(board: board, ship_placer: ship_placer)
random_ship_placer.place(cruiser)
random_ship_placer.place(battleship)
random_ship_placer.place(submarine)
random_ship_placer.place(destroyer)
random_ship_placer.place(tug)

console_board_render = ConsoleBoardRender.new(board)
console_board_render.render