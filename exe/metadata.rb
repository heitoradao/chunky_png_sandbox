#! /usr/bin/env ruby
# HAJ


require 'chunky_png'

puts <<~TXT
    This script will try to read some metadata of file avatar.png
    Then it will create output/with_metadata_after.png
    Author = "altered from ruby"

    TXT

# Accessing metadata
image = ChunkyPNG::Image.from_file('input/avatar.png')
puts image.metadata['Title']
image.metadata['Author'] = 'altered from ruby'
image.save('output/with_metadata_after.png')

# Low level access to PNG chunks
#png_stream = ChunkyPNG::DataStream.from_file('avatar.png')
#png_stream.each_chunk { |chunk| p chunk.type }
