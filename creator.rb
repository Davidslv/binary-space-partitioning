require './lib/map_creator'

class Creator

  attr_reader :tree

  def initialize(width:, height:)
    @width, @height = width, height
  end

  def setup
    create_tree
    create_nodes
    create_rooms
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
end
