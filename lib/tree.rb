require_relative 'node'

require 'pry'
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

  # 30x30 grid is a huge amount of output to the screen already
  # to avoid getting stuck, do not print the output on the screen.
  # USAGE: tree = Tree.create; false
  # 480x480 grid creates about 6803 nodes
  def self.create
    tree = self.new

    tree.root = Node.new(x: 0, y: 0, width: 25, height: 25)
    tree.nodes.push(tree.root)

    did_split = true

      while(did_split) do
        did_split = false

        tree.nodes.each do |node|
          if node.left.nil? || node.right.nil?
            if (node.split!)
              tree.nodes.push(node.left)
              tree.nodes.push(node.right)

              did_split = true
            end
          end
        end
      end

    tree.root.create_room
    tree
  end
end
