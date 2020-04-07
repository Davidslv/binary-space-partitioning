require_relative 'node'

class Tree
  # A Tree structure is responsible for:
  # - Managing the nodes
  # - Manipulating the nodes
  # - Navigating through the nodes
  # - Creating new nodes
  # - Expanding the tree

  # Needs to know about
  # - Where each split is
  # - Split direction (horizontal or vertical)
  # - Area and location of a subdivided space (node)
  # - Area and location of each room
  # - Location and area of each corridor
  # - Easy access to siblings

  # root is the first Node
  attr_accessor :root, :nodes

  def initialize
    @root = root
    @nodes = []
  end
end
