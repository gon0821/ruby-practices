#!/usr/bin/env ruby
require 'date'
require 'optparse'

INDENT = (3..21).step(3).to_a.freeze
DAY_OF_WEEK = %w(日 月 火 水 木 金 土).freeze

params = ARGV.getopts('y:','m:')
year = params['y']&.to_i || Date.today.year
month = params['m']&.to_i || Date.today.month

def set_year_month(year, month)
  puts "#{month}月　#{year}".rjust(15)
end

def set_day_of_the_week
  DAY_OF_WEEK.each do |day|
    print "#{day}".rjust(2)
  end
  print "\n"
end

def display_dates(year, month)
  beginning_of_month = Date.new(year, month, 1)
  end_of_month = Date.new(year, month, -1)

  set_dates_of_month(beginning_of_month, INDENT[beginning_of_month.wday])

  (beginning_of_month.next..end_of_month).each do |day|
    set_dates_of_month(day, INDENT[0])
  end
end

def set_dates_of_month(day, indent)
  print day.saturday? ? "#{day.day}\n".rjust(indent + 1) : "#{day.day}".rjust(indent)
end

set_year_month(year, month)
set_day_of_the_week
display_dates(year, month)
