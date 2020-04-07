module MapCreator
  class CreateTree
    def initialize(width:, height:)
      @width, @height = width, height
    end

    def call
      tree = Tree.new
      tree.root = Node.new(x: 0, y: 0, width: @width, height: @height, direction: nil)
      tree.nodes.push(tree.root)

      tree
    end
  end
end
