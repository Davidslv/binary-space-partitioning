module MapCreator
  class CreateRooms
    def initialize(tree:)
      @tree = tree
    end

    def call
      creating_rooms = true

        while(creating_rooms) do
          creating_rooms = false

          @tree.nodes.each_with_index do |node, index|
            if node.room.nil?
              # a room can have a minimum width of 3,
              # -2 guarantees it's smaller than node width
              width = rand(Room::MINIMUM_SIZE..(node.width - 2).abs)

              # a room can be a minimum height of 3,
              # -2 guarantees it's smaller than node height
              height = rand(Room::MINIMUM_SIZE..(node.height - 2).abs)

              x = rand(1..(node.width - width - 1).abs)
              y = rand(1..(node.height - height - 1).abs)

              puts "creating rooms (node#{index}): x:#{x}, y: #{y}, width: #{width}, height: #{height}"

              if x.nil?
                x = rand(1..(node.width - (node.x - 1)).abs)
              elsif y.nil?
                y = rand(1..(node.height - (node.y - 1)).abs)
              end

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
