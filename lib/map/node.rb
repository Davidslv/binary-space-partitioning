require_relative 'room'

class Node
  # The node is responsible for itself:
  # - knows which node is its parent
  # - knows which nodes are its children
  # - manages it's own data
  # - does not know about the Tree
  class TooManyChildrenError < StandardError; end

  MINIMUM_NODE_SIZE = 6
  MAXIMUM_NODE_SIZE = 20

  attr_accessor :left, :right
  attr_accessor :parent, :sister
  attr_accessor :room, :passages

  # position and area of the node
  attr_reader :x, :y, :width, :height
  attr_reader :value
  attr_reader :direction

  def initialize(x:, y:, width:, height:, direction:)
    @x, @y = x, y
    @width, @height = width, height
    @value = '#'
    @direction = direction
    @split_horizontal = false

    # a node without a parent is considered the root node the parent of all nodes
    # There should only be one in the same tree.
    @parent = nil

    # sister nodes are nodes that are on the *same level* with the same parent
    @sister = nil

    # passages are connection between two rooms
    # since it's a "walkable" area we can consider passages as rooms
    @passages = []

    puts "node | x: #{x}, y: #{y}, width: #{width}, height: #{height}, direction: #{direction}, value: #{value}" if false
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

  # naive implementation as this does not check node level
  # "sister nodes are nodes that are on the *same level* with the same parent"
  # see: https://www.geeksforgeeks.org/find-right-sibling-binary-tree-parent-pointers/
  def sister?(node)
    self.parent == node.parent &&
      node.sister == self
  end

  # a node without children is called a leaf.
  # leafs are the last nodes at the bottom of the tree
  # here it checks wether left and right are nil
  def leaf?
    !(@left && @right)
  end

  def split!
    if !@left.nil? || !@right.nil?
      return false
    end

    if (@width > @height)
      @split_horizontal = false
    elsif (@height > @width)
      @split_horizontal = true
    end

    maximum = (@split_horizontal ? @height : @width) - MINIMUM_NODE_SIZE

    return false if maximum < MINIMUM_NODE_SIZE

    split_number = rand(MINIMUM_NODE_SIZE..maximum)

    if @split_horizontal
      self.left = Node.new(x: x, y: y, width: @width, height: split_number, direction: 'horizontal')
      self.right = Node.new(x: x, y: y + split_number, width: @width, height: @height - split_number, direction: 'horizontal')
    else
      self.left = Node.new(x: x, y: y, width: split_number, height: @height, direction: 'vertical')
      self.right = Node.new(x: x + split_number, y: y, width: @width - split_number, height: @height, direction: 'vertical')
    end

    self.left.parent = self
    self.right.parent = self
    self.left.sister = self.right
    self.right.sister = self.left

    return true
  end
end
