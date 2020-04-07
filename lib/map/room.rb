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
  end
end
