class Image

  def initialize (picture)
    @picture = picture
  end

  def get_ones
    ones = []
    @picture.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

  def blur!(blur_distance)
    ones = get_ones

    @picture.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        ones.each do |found_row_number, found_col_number|
          if manhattan_distance(col_number, row_number, found_col_number, found_row_number) <= blur_distance
            @picture[row_number][col_number] = 1
          end
        end
      end
    end
  end

  def manhattan_distance (x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs

    horizontal_distance + vertical_distance
  end

  def output_image
    @picture.each do |data|
      puts data.join
    end
  end
end

image1 = Image.new([
[0, 0, 0, 0],
[0, 0, 0, 0],
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 0],
[0, 0, 0, 0],
])

image2 = Image.new([
[0, 0, 0, 0],
[0, 0, 0, 0],
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 0],
[0, 0, 0, 0],
])

image3 = Image.new([
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 1, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 1],
])

puts "original image - Manhattan disatnce of l"
image1.output_image
puts "blured image - Manhattan disatnce of l"
image1.blur!(1)
image1.output_image

puts "original image - Manhattan disatnce of 2"
image2.output_image
puts "blured image - Manhattan disatnce of 2"
image2.blur!(2)
image2.output_image

puts "original image - Manhattan disatnce of 3"
image3.output_image
puts "blured image - Manhattan disatnce of 3"
image3.blur!(3)
image3.output_image