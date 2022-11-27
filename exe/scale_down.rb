#! /usr/bin/env ruby
# HAJ

require 'optparse'
require 'chunky_png'
require 'pry'

options = {}

option_parser = OptionParser.new do |opts|
  opts.on('-o OUTPUT_DIRECTORY', '--output OUTPUT_DIRECTORY',
          'The directory to write the processed images') do |directory|
    options[:output_directory] = directory
  end
end


class ImageHandler

  attr_accessor :filename
  attr_accessor :image
  attr_accessor :resize_factor

  def initialize(filename)
    raise "'#{filename}' not exists" if not File.exists?(filename)
    @image = ChunkyPNG::Image.from_file filename
    @resize_factor = 0.5
  end

  def resize(filename)
    @new_img = @image.resize(@image.width * resize_factor, @image.height * resize_factor)
  end

  def save(path)
    @new_img.save(path)
  end
end

option_parser.parse!
if ARGV.empty?
  warn 'Wrong number of arguments.'
  # option_parser.usage
  exit 1
end

binding.pry

ARGV.each do |file|
  if !File.exist?(file)
    puts "#{file} not exists"
  end

  handler = ImageHandler.new( file )
  handler.resize( file )
  handler.save("#{options[:output_directory]}/#{file}")
end

