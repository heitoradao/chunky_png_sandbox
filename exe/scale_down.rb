#! /usr/bin/env ruby
# HAJ

require 'optparse'
require_relative '../lib/image_handler'
require 'pry'

options = {}

option_parser = OptionParser.new do |opts|
  opts.on('-o OUTPUT_DIRECTORY', '--output OUTPUT_DIRECTORY',
          'The directory to write the processed images') do |directory|
    options[:output_directory] = directory
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

  handler = ImageHandler.new( file )
  handler.resize
  output_path = "#{ options[:output_directory] }/#{ File.basename(file) }"
  handler.save(output_path)
end

