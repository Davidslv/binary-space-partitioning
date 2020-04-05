class Node
  # The node is responsible for itself:
  # - knows which node is its parent
  # - knows which nodes are its children
  # - manages it's own data
  # - does not know about the Tree
  class TooManyChildrenError < StandardError; end

  attr_accessor :left, :right
  attr_accessor :parent, :sisters
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
    @sisters = []

    # passages are connection between two rooms
    # since it's a "walkable" area we can consider passages as rooms
    @passages = []
  end

  # naive implementation as this does not check node level
  # "sister nodes are nodes that are on the *same level* with the same parent"
  # see: https://www.geeksforgeeks.org/find-right-sibling-binary-tree-parent-pointers/
  def sister?(node)
    self.parent == node.parent &&
      node.sisters.include?(self)
  end

  # a node without children is called a leaf.
  # leafs are the last nodes at the bottom of the tree
  # here it checks wether left and right are nil
  def leaf?
    !(@left && @right)
  end
end
