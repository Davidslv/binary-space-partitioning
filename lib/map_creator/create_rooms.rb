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
              max_room_width = node.width - (2 * 1)
              max_room_height = node.height - (2 * 1)

              # room is too big to fit in this partition
              # do not create it.
              return if max_room_width < Room::MINIMUM_SIZE || max_room_height < Room::MINIMUM_SIZE

              width = rand(Room::MINIMUM_SIZE..max_room_width)
              height = rand(Room::MINIMUM_SIZE..max_room_height)

              x = node.x + rand(1..(node.width - max_room_width - 1))
              y = node.y + rand(1..(node.height - max_room_height - 1))

              puts "room| x: #{x}, y: #{y}"

              node.room = Room.new(
                x: x,
                y: y,
                width: width,
                height: height,
                value: (65 + rand(26)).chr
              )

              creating_rooms = true
            end
          end
        end

      @tree
    end
  end
end
