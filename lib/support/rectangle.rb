module Support
  class Rectangle
    def initialize(x:, y:, width:, height:)
      @x1 = x
      @y1 = y
      @x2 = x + width
      @y2 = y + height
      @width, @height = width, height
    end

    def center
      [
        (@x1 + @x2) / 2,
        (@y1 + @y2)/ 2
      ]
    end
  end
end
