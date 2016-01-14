require 'rmagick'
include Magick

class Painter
  def initialize(canvas, colours)
    @canvas = canvas
    @colours = colours
  end

  def paint
    palette = Magick::ImageList.new
    palette.new_image(@canvas.width, @canvas.height)

    width_increment = @canvas.width / @colours.count

    top_left = 0
    top_right = top_left + width_increment

    @colours.each do |colour|
      rect = Magick::Draw.new
      rect.fill(colour.rgb)
      rect.rectangle(top_left, 0, top_right, @canvas.height)
      rect.draw(palette)
      top_left += width_increment
      top_right += width_increment
    end

    palette.display
  end
end
