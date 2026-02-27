#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

params = ARGV.getopts('lwc')

def input_result(input)
  [
    input.scan(/\R/).count,
    input.split.count,
    input.bytesize,
  ]
end

def format_result(result, name, params)
  array = []
  if params['l'] || params['w'] || params['c']
    array << result[0].to_s.rjust(8) if params['l']
    array << result[1].to_s.rjust(7) if params['w']
    array << result[2].to_s.rjust(7) if params['c']
  else
    array.push(result[0].to_s.rjust(8), result[1].to_s.rjust(7), result[2].to_s.rjust(7))
  end
  array << name
  array.join(' ')
end

if ARGV.count >= 1
  sum = [0, 0, 0]
  ARGV.each do |file|
    result = input_result(File.read(file))
    sum[0] += result[0]
    sum[1] += result[1]
    sum[2] += result[2]
    puts format_result(result, file, params)
  end

  if ARGV.count >= 2
    puts format_result(sum, 'total', params)
  end
else
  input = readlines.join
  result = input_result(input)
  puts format_result(result, "", params)
end
