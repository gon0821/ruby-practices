# frozen_string_literal: true

require 'optparse'
require 'etc'

COLUMN_SIZE = 3

params = ARGV.getopts('l')
entries = Dir.glob('*')

def file_type(file)
  {
    '01' => 'p',
    '02' => 'c',
    '04' => 'd',
    '06' => 'b',
    '10' => '-',
    '12' => 'l',
    '14' => 's'
  }[file]
end

def file_permission(file)
  {
    '0' => '---',
    '1' => '--x',
    '2' => '-w-',
    '3' => '-wx',
    '4' => 'r--',
    '5' => 'r-x',
    '6' => 'rw-',
    '7' => 'rwx'
  }[file]
end

def file_additional_permission(file, total_permission)
  case file
  when '1'
    total_permission[8] = total_permission[8] == 'x' ? 't' : 'T'
  when '2'
    total_permission[5] = total_permission[5] == 'x' ? 's' : 'S'
  when '4'
    total_permission[2] = total_permission[2] == 'x' ? 's' : 'S'
  else
    ''
  end
  total_permission
end

def total_block(entries)
  puts "total #{entries.sum { |entry| File.stat(entry).blocks }}"
end

def file_detail(entry)
  file = File.stat(entry)
  file_mode = format('%06o', file.mode)

  print file_type(file_mode.slice(0, 2))
  total_permission = file_permission(file_mode.slice(3, 1)) + file_permission(file_mode.slice(4, 1)) + file_permission(file_mode.slice(5, 1))
  print file_additional_permission(file_mode.slice(2, 1), total_permission)
  print file.nlink.to_s.rjust(3)
  print Etc.getpwuid(file.uid).name.rjust(11)
  print Etc.getgrgid(file.gid).name.rjust(7)
  print file.size.to_s.rjust(6)
  print file.mtime.month.to_s.rjust(2)
  print file.mtime.strftime(' %e %R ')
  puts File.path(entry)
end

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

if params['l']
  total_block(entries)
  entries.each do |entry|
    file_detail(entry)
  end
else
  formatted_entries.each do |row|
    row.each do |column|
      print column&.ljust(24)
    end
    puts
  end
end
