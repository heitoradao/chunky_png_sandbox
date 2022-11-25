#! ruby
require 'chunky_png'

# Creating an image from scratch, save as an interlaced PNG

png = ChunkyPNG::Image.new(16, 16, ChunkyPNG::Color::TRANSPARENT)
png[1,1] = ChunkyPNG::Color.rgba(10, 20, 30, 128)
png[2,1] = ChunkyPNG::Color('black @ 0.5')

#png.save('filename.png')
png.save('filename.png', :interlace => false)

avatar = ChunkyPNG::Image.from_file('avatar.png')
badge  = ChunkyPNG::Image.from_file('ruby.png')

avatar.compose!(badge, 10, 10)
avatar.save('composited-fast.png', :fast_rgba)
avatar.save('composited-default.png')

# Accessing metadata
image = ChunkyPNG::Image.from_file('avatar.png')
puts image.metadata['Title']
image.metadata['Author'] = 'altered from ruby'
image.save('with_metadata_after.png')

# Low level access to PNG chunks
#png_stream = ChunkyPNG::DataStream.from_file('avatar.png')
#png_stream.each_chunk { |chunk| p chunk.type }
