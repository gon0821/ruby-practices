#!/usr/bin/env ruby
require 'date'
require 'optparse'

params = ARGV.getopts('m:')

# p params['m'].to_i

month = params['m'].to_i

first_day = Date.new(2025, month, 1)

p first_day.day
