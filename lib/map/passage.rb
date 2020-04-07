class Passage
  # x, y are the coordinates of the passage location within the node
  # the width and height should not be larger than the respective node's
  # although they can be smaller and positioned anywhere within the node.
  attr_reader :x, :y
  attr_reader :width, :height

  def initialize(x:, y:, width:, height:)
    @x, @y = x, y
    @width, @height = width, height
  end
end

# https://gamedevelopment.tutsplus.com/tutorials/how-to-use-bsp-trees-to-generate-game-maps--gamedev-12268
# https://github.com/Davidslv/RoguelikeDevResources
# http://rubyquiz.com/quiz80.html
# https://www.gridsagegames.com/blog/2014/07/dungeon-prefabs/
# http://roguebasin.roguelikedevelopment.org/index.php?title=Basic_BSP_Dungeon_generation
