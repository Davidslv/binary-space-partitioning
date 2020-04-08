module Vanilla
  class Cell
    attr_reader :row, :column
    attr_accessor :north, :south, :east, :west

    def initialize(row:, column:)
      @row, @column = row, column
      @links = {}
    end

    def link(cell:, bidirectional: true)
      @links[cell] = true
      cell.link(cell: self, bidirectional: false) if bidirectional

      self
    end

    def unlink(cell:, bidirectional: true)
      @links.delete(cell)
      cell.unlink(cell: self, bidirectional: false) if bidirectional
    end

    def links
      @links.keys
    end

    def linked?(cell)
      @links.key?(cell)
    end

    def neighbors
      list = []
      list << north if north
      list << south if south
      list << east if east
      list << west if west
    end
  end
end
