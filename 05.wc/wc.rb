#!/usr/bin/env ruby
# frozen_string_literal: true

def file_result(file)
  [
    File.read(file).scan(/\R/).count,
    File.read(file).split.count,
    File.read(file).bytesize,
  ]
end

def format_result(result, name)
  result[0] = result[0].to_s.rjust(8)
  result[1] = result[1].to_s.rjust(7)
  result[2] = result[2].to_s.rjust(7)
  result[3] = name
  result.join(' ')
end

sum = [0, 0, 0]
ARGV.each do |file|
  result = file_result(file)
  sum[0] += result[0]
  sum[1] += result[1]
  sum[2] += result[2]
  puts format_result(result, file)
end

if ARGV.count >= 2
  puts format_result(sum, 'total')
end
