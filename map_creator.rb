require './lib/map'

class MapCreator
  def initialize(width:, height:)
    @width, @height = width, height
  end

  def setup
    create_tree
    create_nodes
    create_rooms
  end

  def tree
    @tree
  end

  def create_tree
    @tree = Tree.new
    @tree.root = Node.new(x: 0, y: 0, width: @width, height: @height)
    @tree.nodes.push(@tree.root)
  end

  def create_nodes
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
  end

  def create_rooms
    creating_rooms = true

    while(creating_rooms) do
      creating_rooms = false

      @tree.nodes.each do |node|
        if node.room.nil?
          node.room = Room.new(
            x: rand(1..(node.width - node.x - 1)),
            y: rand(1..(node.height - node.y - 1)),
            # a room can have a minimum width of 3,
            # -2 guarantees it's smaller than node width
            width: rand(3..(node.width - 2)),
            # a room can be a minimum height of 3,
            # -2 guarantees it's smaller than node height
            height: rand(3..(node.height - 2)),
          )

          creating_rooms = true
        end
      end
    end
  end

# end
end
