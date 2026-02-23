#!/usr/bin/env ruby
# frozen_string_literal: true

def file_detail(file)
  [
    File.read(file).split(/\R/).count.to_s.rjust(8),
    File.read(file).split.count.to_s.rjust(7),
    File.read(file).bytesize.to_s.rjust(7),
    file
  ].join(' ')
end

ARGV.each do |file|
  puts file_detail(file)
end
