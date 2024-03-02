require_relative '../lib/image_handler'

RSpec.describe ImageHandler do
  before do
    @img = ImageHandler.new('input/chara1.png')
  end

  it 'can be instantiated' do
    obj = ImageHandler.new('input/Wizard_f.png')

    expect(obj).to_not be nil
  end

  it 'can crop an image' do
    pending
    # o o o o
    # o o o o
    # . . .
    # . . .
    # . . .
    # . . .
    # 624 x 576

    one_char_sheet_width = 624 / 4
    one_char_sheet_heght = 576 / 2

    x, y, w, h = [0, 0, 624 / 4, 576 / 2]
    new_img = @img.crop(x, y, w, h)
  end

  it 'permit its client to use ChunkyPng obj' do
    expect(@img.image).to be_a ChunkyPNG::Image
  end
end

