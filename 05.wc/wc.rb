#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

params = ARGV.getopts('lwc')

def file_result(file)
  [
    File.read(file).scan(/\R/).count,
    File.read(file).split.count,
    File.read(file).bytesize,
  ]
end

def format_result(result, name, params)
  array = []
  if params['l'] || params['w'] || params['c']
    array << result[0].to_s.rjust(8) if params['l']
    array << result[1].to_s.rjust(7) if params['w']
    array << result[2].to_s.rjust(7) if params['c']
  elsif
    array.push(result[0].to_s.rjust(8), result[1].to_s.rjust(7), result[2].to_s.rjust(7))
  end
  array << name
  array.join(' ')
end

sum = [0, 0, 0]
ARGV.each do |file|
  result = file_result(file)
  sum[0] += result[0]
  sum[1] += result[1]
  sum[2] += result[2]
  puts format_result(result, file, params)
end

if ARGV.count >= 2
  puts format_result(sum, 'total', params)
end
