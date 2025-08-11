# frozen_string_literal: true

COLUMN_SIZE = 3

directory_contents = Dir.glob('*')

row_size = directory_contents.size.fdiv(COLUMN_SIZE).ceil

def sliced_directory_contents(directory_contents, row_size)
  directory_contents.each_slice(row_size).to_a
end

def transposed_directory_contents(directory_contents, row_size)
  Array.new(row_size) do |index|
    directory_contents.map do |row_content|
      row_content[index]
    end
  end
end

sliced_directory_contents = sliced_directory_contents(directory_contents, row_size)
formatted_directory_contents = transposed_directory_contents(sliced_directory_contents, row_size)

formatted_directory_contents.each do |row|
  row.each do |column|
    print column&.ljust(24)
  end
  puts
end
