# frozen_string_literal: true

require 'chunky_png'
require 'forwardable'

class ImageHandler
  extend Forwardable

  def_delegator :@image, :crop

  attr_accessor :filename, :image

  def initialize(filename)
    @filename = filename
    @image = ChunkyPNG::Image.from_file(filename)
  end

  def resize(factor: 0.5, path: nil)
    if factor.kind_of?(String)
        factor = eval(factor)
    end

    @new_image = image.resize((@image.width * factor).to_i, (@image.height * factor).to_i)
    @new_image.save(path) if path
    @new_image
  end

  ## @deprecated
  def save(path)
    @new_image.save(path)
  end

  def method_missing(m, *args, &block)
    @image.send(m, args, &block)
  end
end

