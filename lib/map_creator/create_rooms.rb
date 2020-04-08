module MapCreator
  class CreateRooms
    def initialize(tree:)
      @tree = tree
    end

    def call
      creating_rooms = true

        while(creating_rooms) do
          creating_rooms = false

          @tree.nodes.each do |node|
            if node.room.nil?
              # a room can have a minimum width of 3,
              # -2 guarantees it's smaller than node width
              width = rand(Room::MINIMUM_SIZE..(node.width - 2).abs)

              # a room can be a minimum height of 3,
              # -2 guarantees it's smaller than node height
              height = rand(Room::MINIMUM_SIZE..(node.height - 2).abs)

              x = rand(1..(node.width - width - 1).abs)
              y = rand(1..(node.height - height - 1).abs)

              node.room = Room.new(
                x: x,
                y: y,
                width: width,
                height: height,
              )

              creating_rooms = true
            end
          end
        end

      @tree
    end
  end
end
