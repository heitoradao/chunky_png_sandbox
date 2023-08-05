#! /usr/bin/env ruby
# HAJ

require 'chunky_png'

filenames = Dir['input/fes_*.png']

# it should have 4 files

images = filenames.map do |f|
  ChunkyPNG::Image.from_file(f)
end

width = images[0].width
height = images[0].height

# assert that all images have the same size
images.all? { |i| i.width == width && i.height == height }

img_common = ChunkyPNG::Image.new(width, height, ChunkyPNG::Color::TRANSPARENT)


diff_img = images.map do
  ChunkyPNG::Image.new(width, height, ChunkyPNG::Color::TRANSPARENT)
end

for y in 0...height do
  for x in 0...width do

    color_is_equal = true    # we first assume it's true for all images we are comparing
    
    color = images[0][x,y]   # The pivot color
    
    for img in images
      color_is_equal = false if img[x,y] != color
    end

    if color_is_equal
      img_common[x,y] = color
    else
      index = 0
      for img in images do
        diff_img[index][x,y] = img[x,y]
        index += 1
      end
    end
  end
end

img_common.save('output/common.png')

index = 0
for img in diff_img do
  img.save("output/diff_img_#{index}.png")
  index += 1
end

#require 'irb'
#IRB.start(__FILE__)
