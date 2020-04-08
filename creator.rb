require './lib/map_creator'

class Creator

  attr_reader :tree

  def initialize(width:, height:)
    @width, @height = width, height
  end

  def setup
    puts ""
    puts "// Setup ---------------------"
    create_tree
    create_nodes
    create_rooms
    set_map
    show_map
  end

  private

    def create_tree
      @tree = MapCreator::CreateTree.new(width: @width, height: @height).call
    end

    def create_nodes
      MapCreator::CreateNodes.new(tree: @tree).call
    end

    def create_rooms
      MapCreator::CreateRooms.new(tree: @tree).call
    end

    def set_map
      @bitmap = MapCreator::Bitmap.new(width: @width, height: @height)

      @tree.nodes.each do |node|
        sleep 0.06
        puts ""
        puts @bitmap.to_s

        room = node.room

        (room.x1 + 1..room.x2).each do |x|
          (room.y1 + 1..room.y2).each do |y|
            @bitmap.set(x, y, room.value)
          rescue NoMethodError, TypeError => e
            binding.pry if false
          end
        end
      end
    end

    def show_map
      puts @bitmap.to_s
    end
end
