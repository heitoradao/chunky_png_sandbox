#! /usr/bin/env ruby
# HAJ

require 'chunky_png'
require_relative '../lib/image_handler'
require 'pry'

# VXA sprite characters is a matrix of matrixes.
# One single sprite char have the form:
# | 1 2 3 |
# | 4 5 6 |
# | 7 8 9 |
# | a b c |

# The matrix of chars have the form:
# | 1 2 3 4 |
# | 5 6 7 8 |

n = 5 # line 2, col 2
# Creating an image from scratch, save as an interlaced PNG

sprite_sheet = ChunkyPNG::Image.from_file('input/chara1.png')
height_one = sprite_sheet.height / 2
width_one = sprite_sheet.width / 4

crop = sprite_sheet.crop(n % 4 * width_one, n / 4 * height_one, width_one, height_one)

# new_image = ChunkyPNG::Image.new(16, 16, ChunkyPNG::Color::TRANSPARENT)
# new_image.compose!(one_sheet)

crop.save('output/!$witch.png', :interlace => false)

binding.pry

if crop[1,1] == ChunkyPNG::Color::TRANSPARENT
  puts 'the first pixel is transparent!'
end

