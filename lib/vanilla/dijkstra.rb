require_relative 'output/terminal'
require_relative 'cell_distance'
require_relative 'distance_grid'
require_relative 'binary_tree'

grid = Vanilla::DistanceGrid.new(rows: 5, columns: 5)
Vanilla::BinaryTree.on(grid)

start = grid[0, 0]
distances = start.distances

grid.distances = distances

puts Vanilla::Output::Terminal.new(grid)
