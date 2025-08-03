# frozen_string_literal: true

COLUMN_COUNT = 3

current_entries = Dir.entries('.')

displayed_entries = current_entries.reject do |file|
  file.start_with?('.')
end

sorted_entries = displayed_entries.sort

entry_count = displayed_entries.size
row_size = (entry_count - 1) / COLUMN_COUNT + 1

def sliced_array(entries, size)
  array = []
  entries.each_slice(size) do |entry|
    array.push(entry)
  end
  array
end

def transposed_array(arrays, size)
  entries = []
  size.times do |n|
    row_array = arrays.map do |array|
      array[n]
    end
    entries.push(row_array)
  end
  entries
end

entries = transposed_array(sliced_array(sorted_entries, row_size), row_size)

entries.each do |entry|
  entry.each do |e|
    print e&.ljust(24)
  end
  puts
end
