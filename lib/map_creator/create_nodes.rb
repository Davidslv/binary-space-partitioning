module MapCreator
  class CreateNodes
    def initialize(tree:)
      @tree = tree
    end

    def call
      splitting_nodes = true

        while(splitting_nodes) do
          splitting_nodes = false

          @tree.nodes.each do |node|
            if node.left.nil? || node.right.nil?

              if (node.split!)
                @tree.nodes.push(node.left)
                @tree.nodes.push(node.right)

                splitting_nodes = true
              end

            end
          end
        end
        puts "--------------------------------------------------"

      @tree
    end
  end
end
