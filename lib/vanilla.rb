require 'pry'

module Vanilla
  require_relative 'vanilla/cell'
  require_relative 'vanilla/grid'
  require_relative 'vanilla/output/terminal'

  class BinaryTree
    def self.on(grid)
      grid.each_cell do |cell|
        neighbors = []
        neighbors << cell.north if cell.north
        neighbors << cell.east if cell.east
        neighbor = neighbors.sample

        cell.link(cell: neighbor) if neighbor
      end
    end

  end

  def self.play(rows: 10, columns: 10, png: false)
    grid = Vanilla::Grid.new(rows: rows, columns: columns)
    Vanilla::BinaryTree.on(grid)
    puts Vanilla::Output::Terminal.new(grid)

    if png
      require_relative 'vanilla/output/png'
      Vanilla::Output::Png.new(grid).to_png
    end
  end
end
