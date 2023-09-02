#! /usr/bin/env ruby
# HAJ

require 'chunky_png'
require 'optparse'

options = {
  input: 'input/character1.png',
  output: 'part_',
  n: nil
}

option_parser = OptionParser.new do |opts|
  opts.on('-i', '--input FILENAME') do |filename|
    options[:input] = filename
  end

  opts.on('-o', '--output FILENAME') do |basename|
    options[:output] = basename
  end

  opts.on('-n INDEX') do |index|
    index = index.to_i
    if index.kind_of?(Integer) && index < 8
      options[:n] = index
    end
  end

  opts.on('-h', '--help') do
    print opts
    puts <<~TXT
      Examples:
        exe/split_charset.rb -i input/chara1.png -n 5 -b mage
    TXT
    exit
  end
end

option_parser.parse!

# -------------------------------


def slice_sprite_sheet2(sprite_sheet, rows, columns, index = nil)
  h = sprite_sheet.height / rows
  w = sprite_sheet.width / columns

  if index.nil? # return array of all sprite sheets
    return Array.new(rows * columns) do |n|
      sprite_sheet.crop(n % columns * w, n / columns * h, w, h)
    end
  else # just the requested
    return [sprite_sheet.crop(index % columns * w, index / columns * h, w, h)]
  end
end


NUM_SPRITE_SHEET_IN_ROW = 2
NUM_SPRITE_SHEET_IN_COLUMN = 4

img = ChunkyPNG::Canvas.from_file(options[:input])
parts = slice_sprite_sheet2(img, NUM_SPRITE_SHEET_IN_ROW, NUM_SPRITE_SHEET_IN_COLUMN, options[:n])

parts.each_with_index do |img, i|]
  img.save("output/#{options[:output]}#{i}")
end
