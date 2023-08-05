#! /usr/bin/env ruby
# HAJ


require 'chunky_png'

# Creating an image from scratch, save as an interlaced PNG

base = ChunkyPNG::Image.from_file('input/avatar.png')
feature  = ChunkyPNG::Image.from_file('input/ruby.png')

base.compose!(feature, 10, 10)
base.save('output/composited-fast.png', :fast_rgba)
base.save('output/composited-default.png')

