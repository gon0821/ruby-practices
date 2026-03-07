#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

params = ARGV.getopts('lwc')

def main(params)
  sum = { lines: 0, words: 0, bytes: 0 }
  ARGV.each do |file|
    result = count_text(File.read(file))
    sum[:lines] += result[:lines]
    sum[:words] += result[:words]
    sum[:bytes] += result[:bytes]
    puts format_result(result, file, params)
  end
  puts format_result(sum, 'total', params) if ARGV.count >= 2

  return unless ARGV.count.zero?

  result = count_text(readlines.join)
  puts format_result(result, '', params)
end

def count_text(file_or_standard_input)
  {
    lines: file_or_standard_input.scan(/\n/).count,
    words: file_or_standard_input.split.count,
    bytes: file_or_standard_input.bytesize
  }
end

def format_result(result, name, params)
  displayed_line = []
  if params['l'] || params['w'] || params['c']
    displayed_line << result[:lines].to_s.rjust(8) if params['l']
    displayed_line << result[:words].to_s.rjust(7) if params['w']
    displayed_line << result[:bytes].to_s.rjust(7) if params['c']
  else
    displayed_line.push(result[:lines].to_s.rjust(8), result[:words].to_s.rjust(7), result[:bytes].to_s.rjust(7))
  end
  displayed_line << name
  displayed_line.join(' ')
end

main(params)
