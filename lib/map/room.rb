class Room < Support::Rectangle
  # x, y are the coordinates of the room location within the node
  # the width and height should not be larger than the respective node's
  # although they can be smaller and positioned anywhere within the node.
  attr_reader :x, :y
  attr_reader :width, :height
  attr_reader :value

  MINIMUM_SIZE = 2

  def initialize(x:, y:, width:, height:, value:)
    @x, @y = x, y
    @width, @height = width, height
    @value = value || '.'

    puts "room | x: #{x}, y: #{y}, width: #{width}, height: #{height}, value: #{value}" if false
  end

  def center
    [
      (@x + (@x + @width)) / 2,
      (@y + (@y + @height)) / 2
    ]
  end

  def x1
    @x
  end

  def x2
    @x + @width
  end

  def y1
    @y
  end

  def y2
    @y + @height
  end
end
