require 'chunky_png'

module Vanilla
  module Output
    class Png
      def initialize(grid)
        @grid = grid
      end

      def to_png(cell_size: 20)
        img_width = cell_size * @grid.columns
        img_height = cell_size * @grid.rows

        background = ChunkyPNG::Color::BLACK
        wall = ChunkyPNG::Color::WHITE

        img = ChunkyPNG::Image.new(img_width + 1, img_height + 1, background)

        @grid.each_cell do |cell|
          x1 = cell.column * cell_size
          y1 = cell.row * cell_size
          x2 = (cell.column + 1) * cell_size
          y2 = (cell.row + 1) * cell_size

          img.line(x1, y1, x2, y1, wall) unless cell.north
          img.line(x1, y1, x1, y2, wall) unless cell.west

          img.line(x2, y1, x2, y2, wall) unless cell.linked?(cell.east)
          img.line(x1, y2, x2, y2, wall) unless cell.linked?(cell.south)
        end

        img.save "maze_#{rand(1...250)}.png"

        img
      end
    end
  end
end
