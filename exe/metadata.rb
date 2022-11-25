#! /usr/bin/env ruby
# HAJ


require 'chunky_png'

# Accessing metadata
image = ChunkyPNG::Image.from_file('input/avatar.png')
puts image.metadata['Title']
image.metadata['Author'] = 'altered from ruby'
image.save('output/with_metadata_after.png')

# Low level access to PNG chunks
#png_stream = ChunkyPNG::DataStream.from_file('avatar.png')
#png_stream.each_chunk { |chunk| p chunk.type }
