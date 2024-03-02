#! /usr/bin/env ruby
# HAJ

require 'chunky_png'

puts "Creating a transparent png from scratch"

png = ChunkyPNG::Image.new(16, 16, ChunkyPNG::Color::TRANSPARENT)
png[1,1] = ChunkyPNG::Color.rgba(10, 20, 30, 128)
png[2,1] = ChunkyPNG::Color('black @ 0.5')

#png.save('filename.png')
puts "Generating output/transparent.png"
png.save('output/transparent.png', :interlace => false)

