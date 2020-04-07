module MapCreator
  class Bitmap
    DEFAULT_PIXEL_COLOR = '0'.freeze

    def initialize(width:, height:)
      @width, @height = width, height

      init(@width, @height)
    end

    def set(x, y, c)
      @bitmap[y][x] = c
    end

    def get(x, y)
      @bitmap[y][x]
    end

    def to_s
      @bitmap.map { |row| row.join(" ") }.join("\n")
    end

    private

      def init(width, height)
        @bitmap = Array.new(height) do
          Array.new(width) { DEFAULT_PIXEL_COLOR }
        end
      end
  end
end
