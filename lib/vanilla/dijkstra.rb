require_relative 'output/png'
require_relative 'output/terminal'
require_relative 'cell_distance'
require_relative 'distance_grid'
require_relative 'binary_tree'

2.times do
  grid = Vanilla::DistanceGrid.new(rows: 10, columns: 10)
  Vanilla::BinaryTree.on(grid)

  start = grid[0, 0]
  distances = start.distances

  puts "path from northwest corner to southwest corner:"
  grid.distances = distances.path_to(grid[grid.rows - 1, 0])

  puts Vanilla::Output::Terminal.new(grid)
  Vanilla::Output::Png.new(grid).to_png if false # turn off

  sleep 0.4
end
