# frozen_string_literal: true

require 'chunky_png'

class ImageHandler
  attr_accessor :filename, :image, :resize_factor

  def initialize(filename)
    @filename = filename
    @image = ChunkyPNG::Image.from_file(filename)
    @resize_factor = 0.5
  end

  def resize
    @new_image = image.resize((@image.width * resize_factor).to_i, (@image.height * resize_factor).to_i)
  end

  def save(path)
    @new_image.save(path)
  end
end

