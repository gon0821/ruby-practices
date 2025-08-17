# frozen_string_literal: true

require 'optparse'

COLUMN_SIZE = 3

params = ARGV.getopts('r')
entries = params['r'] ? Dir.glob('*').reverse : Dir.glob('*')

row_size = entries.size.ceildiv(COLUMN_SIZE)

def slice_entries(entries, row_size)
  entries.each_slice(row_size).to_a
end

def transpose_entries(entries, row_size)
  Array.new(row_size) do |index|
    entries.map do |row_content|
      row_content[index]
    end
  end
end

slice_entries = slice_entries(entries, row_size)
formatted_entries = transpose_entries(slice_entries, row_size)

formatted_entries.each do |row|
  row.each do |column|
    print column&.ljust(24)
  end
  puts
end
