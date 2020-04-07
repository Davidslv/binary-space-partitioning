class Room
  # x, y are the coordinates of the room location within the node
  # the width and height should not be larger than the respective node's
  # although they can be smaller and positioned anywhere within the node.
  attr_reader :x, :y
  attr_reader :width, :height
  attr_reader :value

  def initialize(x:, y:, width:, height:)
    @x, @y = x, y
    @width, @height = width, height
    @value = '.'

    puts "room | x: #{x}, y: #{y}, width: #{width}, height: #{height}, value: #{value}"
  end

  def top
    @y
  end

  def left
    @x
  end

  def right
    @x + @width - 1
  end

  def bottom
    @y + @height - 1
  end
end
