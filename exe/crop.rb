#! /usr/bin/env ruby
# HAJ

require 'chunky_png'

input = 'input/chara1.png'

img = ChunkyPNG::Image.from_file(input)
# 624 x 576
# 1 sheet = 156 x 288
new_img = img.crop(0, 0, 156, 288)
new_img.save('output/croped.png')


