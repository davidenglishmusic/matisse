class Colour
  FACTOR = 257
  LUMINANCE_R = 0.2126
  LUMINANCE_G = 0.7152
  LUMINANCE_B = 0.0722

  def initialize(rmagick_rgb_colour)
    @red = rmagick_rgb_colour.red / FACTOR
    @green = rmagick_rgb_colour.green / FACTOR
    @blue = rmagick_rgb_colour.blue / FACTOR
  end

  def luminosity
    @red * LUMINANCE_R + @green * LUMINANCE_G + @blue * LUMINANCE_B
  end

  def rgb
    "rgb(#{@red}, #{@green}, #{@blue})"
  end
end
