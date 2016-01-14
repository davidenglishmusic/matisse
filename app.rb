require_relative 'colour'
require_relative 'painter'
require_relative 'canvas'

source_image = ImageList.new('beach.jpg')
quantize_image = source_image.quantize(16, RGBColorspace)
colours_from_histogram = quantize_image.color_histogram

unsorted_colours = []
colours_from_histogram.each do |key, _count|
  colour = Colour.new(key)
  unsorted_colours.push(colour)
end

# unsorted_colours.each do |colour|
#   puts colour.luminosity
# end

sorted_colours = unsorted_colours.sort { |a, b| a.luminosity <=> b.luminosity }

# sorted_colours.each do |colour|
#   puts colour.luminosity
# end

canvas = Canvas.new(1200, 50)

matisse = Painter.new(canvas, sorted_colours)

matisse.paint
