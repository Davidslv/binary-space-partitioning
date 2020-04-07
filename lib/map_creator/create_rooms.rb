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

      @tree
    end
  end
end
