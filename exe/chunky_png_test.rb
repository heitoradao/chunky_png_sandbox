#! /usr/bin/env ruby
# HAJ


require 'chunky_png'

# Creating an image from scratch, save as an interlaced PNG

avatar = ChunkyPNG::Image.from_file('input/avatar.png')
badge  = ChunkyPNG::Image.from_file('input/ruby.png')

avatar.compose!(badge, 10, 10)
avatar.save('output/composited-fast.png', :fast_rgba)
avatar.save('output/composited-default.png')

