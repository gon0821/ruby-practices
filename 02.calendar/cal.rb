#!/usr/bin/env ruby
require 'date'
require 'optparse'

INDENT = 3
DAY_OF_WEEK = %w(日 月 火 水 木 金 土).freeze

params = ARGV.getopts('y:','m:')
year = params['y']&.to_i || Date.today.year
month = params['m']&.to_i || Date.today.month

def set_year_month(year, month)
  puts "#{month}月　#{year}".rjust(15)
end

def set_day_of_the_week
  puts DAY_OF_WEEK.map {it.rjust(2)}.join
end

def display_dates(year, month)
  beginning_of_month = Date.new(year, month, 1)
  end_of_month = Date.new(year, month, -1)

  print " " * (beginning_of_month.wday * INDENT)

  (beginning_of_month..end_of_month).each do |date|
    print date.day.to_s.rjust(INDENT)
    puts if date.saturday?
  end
end

set_year_month(year, month)
set_day_of_the_week
display_dates(year, month)
