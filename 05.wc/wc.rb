#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

params = ARGV.getopts('lwc')
sum = [0, 0, 0]

def main(params, sum)
  ARGV.each do |file|
    result = count_text(File.read(file))
    sum[0] += result[0]
    sum[1] += result[1]
    sum[2] += result[2]
    puts format_result(result, file, params)
  end
  puts format_result(sum, 'total', params) if ARGV.count >= 2

  return unless ARGV.count.zero?

  result = count_text(readlines.join)
  puts format_result(result, '', params)
end

def count_text(file_or_standard_input)
  [
    file_or_standard_input.scan(/\R/).count,
    file_or_standard_input.split.count,
    file_or_standard_input.bytesize
  ]
end

def format_result(result, name, params)
  displayed_line = []
  if params['l'] || params['w'] || params['c']
    displayed_line << result[0].to_s.rjust(8) if params['l']
    displayed_line << result[1].to_s.rjust(7) if params['w']
    displayed_line << result[2].to_s.rjust(7) if params['c']
  else
    displayed_line.push(result[0].to_s.rjust(8), result[1].to_s.rjust(7), result[2].to_s.rjust(7))
  end
  displayed_line << name
  displayed_line.join(' ')
end

main(params, sum)
