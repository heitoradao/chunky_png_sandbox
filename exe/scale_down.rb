#! /usr/bin/env ruby
# HAJ

require 'optparse'
require_relative '../lib/image_handler'
require 'pry'

options = {
  output_directory: 'output',
  factor: 0.5
}

option_parser = OptionParser.new do |opts|
  opts.on('-o', '--output OUTPUT_DIRECTORY',
          'The directory to write the processed images.') do |directory|
    options[:output_directory] = directory
  end

  opts.on('-r', '--ratio FACTOR',
          'The multiplier factor for image size. (default: 0.5)') do |factor|
    options[:factor] = factor
  end
end



option_parser.parse!
if ARGV.empty?
  warn 'Wrong number of arguments.'
  # option_parser.usage
  exit 1
end

ARGV.each do |file|
  if !File.exist?(file)
    puts "#{file} not exists"
  end

  output_path = "#{ options[:output_directory] }/#{ File.basename(file) }"

  handler = ImageHandler.new( file )
  handler.resize(factor: options[:factor], path: output_path)
end

