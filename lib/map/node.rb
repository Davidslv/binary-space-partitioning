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

  def initialize(x:, y:, width:, height:)
    @x, @y = x, y
    @width, @height = width, height

    # a node without a parent is considered the root node the parent of all nodes
    # There should only be one in the same tree.
    @parent = nil

    # sister nodes are nodes that are on the *same level* with the same parent
    @sisters = nil

    # passages are connection between two rooms
    # since it's a "walkable" area we can consider passages as rooms
    @passages = []
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
    return unless @left.nil? || @right.nil?

    horizontal_split = rand() > 0.5

    if (@width > @height && (@width / @height >= 1.25))
      horizontal_split = false
    elsif (@height > @width && @height / @width >= 1.25)
      horizontal_split = true
    end

    maximum = (horizontal_split ? @height : @width) - MINIMUM_NODE_SIZE

    # area is too small to continue spliting
    return false if (maximum <= MINIMUM_NODE_SIZE)

    # determine where to split
    _split = rand(MINIMUM_NODE_SIZE..maximum)

    if horizontal_split
      self.left = Node.new(x: x, y: y, width: @width, height: _split)
      self.right = Node.new(x: x, y: y + _split, width: @width, height: @height - _split)
    else
      self.left = Node.new(x: x, y: y, width: _split, height: @height)
      self.right = Node.new(x: x + _split, y: y, width: @width - _split, height:@height)
    end

    self.left.parent = self
    self.right.parent = self
    self.left.sister = self.right
    self.right.sister = self.left

    return true
  end

  def get_room
    if !room.nil?
      return room
    else
      left_room = if (!left.nil?)
        left.get_room
      end

      right_room = if (!right.nil?)
        right.get_room
      end

      if (left_room.nil? && right.room.nil?)
        return nil
      elsif right_room.nil?
        return left_room
      elsif right_room.nil?
        return right_room
      elsif (rand > 0.5)
        return left_room
      else
        return right_room
      end
    end
  end
end
