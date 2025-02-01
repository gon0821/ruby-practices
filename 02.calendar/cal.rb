#!/usr/bin/env ruby
require 'date'
require 'optparse'

INDENT = [6, 9, 12, 15, 18, 21, 3]
DOW = ["日", "月", "火", "水", "木", "金", "土"]

params = ARGV.getopts('y:','m:')
year = params['y'].to_i
month = params['m'].to_i

puts "#{month}月　#{year}".rjust(15)

DOW.each_with_index do |dow, index|
  if index == 6
    puts "#{dow}".rjust(2)
  else
    print "#{dow}".rjust(2)
  end
end

first_day = Date.new(year, month, 1)
last_day = Date.new(year, month, -1)

(first_day..last_day).each_with_index do |day, index|
  if index == 0
    if day.saturday?
      puts "#{day.day}".rjust(INDENT[day.cwday - 1])
    else
      print "#{day.day}".rjust(INDENT[day.cwday - 1])
    end
  else
    if day.saturday?
      puts "#{day.day}".rjust(3)
    else
      print "#{day.day}".rjust(3)
    end
  end
end
