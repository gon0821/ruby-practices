#!/usr/bin/env ruby
require 'date'
require 'optparse'

INDENT = [3, 6, 9, 12, 15, 18, 21].freeze
DOW = %w(日 月 火 水 木 金 土).freeze

params = ARGV.getopts('y:','m:')
year = params['y'] ? params['y'].to_i : Date.today.year
month = params['m'] ? params['m'].to_i : Date.today.month

def set_year_month(year, month)
  puts "#{month}月　#{year}".rjust(15)
end

def set_day_of_the_week
  DOW.each_with_index do |dow, index|
    if index == 6
      puts "#{dow}".rjust(2)
    else
      print "#{dow}".rjust(2)
    end
  end
end

def display_dates(year, month)
  beginning_of_month = Date.new(year, month, 1)
  end_of_month = Date.new(year, month, -1)

  (beginning_of_month..end_of_month).each_with_index do |day, index|
    if index == 0
      set_beginning_of_month(day)
    else
      set_dates_of_month(day)
    end
  end
end

def set_beginning_of_month(day)
  if day.saturday?
    puts "#{day.day}".rjust(INDENT[day.wday])
  else
    print "#{day.day}".rjust(INDENT[day.wday])
  end
end

def set_dates_of_month(day)
  if day.saturday?
    puts "#{day.day}".rjust(3)
  else
    print "#{day.day}".rjust(3)
  end
end

set_year_month(year, month)
set_day_of_the_week
display_dates(year, month)
