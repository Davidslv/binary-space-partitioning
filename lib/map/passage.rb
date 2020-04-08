class Passage
  attr_accessor :x, :y
  # attr_accessor :width, :height
  attr_reader :value

  # To build passages, we loop through all the nodes of the tree, connecting each node to its sister.
  # If the two rooms have face-to-face walls, we can use a straight corridor.
  # Else we have to use a Z shaped corridor.
  def initialize(room1:, room2:)
    @room1 = room1
    @room2 = room2

    @value = ' '

    @x = nil
    @y = nil
  end

# https://gamedev.stackexchange.com/questions/50570/creating-and-connecting-rooms-for-a-roguelike
# http://roguebasin.roguelikedevelopment.org/index.php?title=Basic_BSP_Dungeon_generation
# http://roguelikedeveloper.blogspot.com/2007/11/unangband-dungeon-generation-part-one.html
  def create_connection
    # # right point of room1
    # self.x, self.y = [(room1.x + room1.width + 1), rand(room1.y..room1.height)]
    # # left point of room2
    # self.x, self.y = [room2.x - 1, rand(room2.y..room1.height)]
    #
    # # left point of room1
    # self.x, self.y = [room1.x - 1, rand(room1.y..room1.height)]
    # # right point of room2
    # self.x, self.y = [(room2.x + room2.width + 1), rand(room2.y..room2.height)]
    #
    # # top point of room1
    # self.x, self.y = [rand(room1.x..room1.width), room1.y + 1]
    # # botoom point of room2
    # self.x, self.y = [rand(room2.x..room2.width), room2.y - 1]
    #
    # # bottom point of room1
    # self.x, self.y = [rand(room1.x..room1.width), room1.y - 1]
    # # top point of room2
    # self.x, self.y = [rand(room2.x..room2.width), room2.y + 1]
  end

end

# https://gamedevelopment.tutsplus.com/tutorials/how-to-use-bsp-trees-to-generate-game-maps--gamedev-12268
# https://github.com/Davidslv/RoguelikeDevResources
# http://rubyquiz.com/quiz80.html
# https://www.gridsagegames.com/blog/2014/07/dungeon-prefabs/
# http://roguebasin.roguelikedevelopment.org/index.php?title=Basic_BSP_Dungeon_generation
