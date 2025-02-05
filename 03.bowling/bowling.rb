#!/usr/bin/env ruby
require 'debug'

params = ARGV[0]
scores = params.split(',')
# ["8", "2", "9", "0", "7", "2", "10", "8", "2", "6", "2", "7", "3", "8", "0", "9", "1"]

shots = []
scores.each do |score|
  if score == "10"
    shots << 10
    shots << 0
  else
    shots << score.to_i
  end
end
# [8, 2, 9, 0, 7, 2, 10, 0, 8, 2, 6, 2, 7, 3, 8, 0, 9, 1]

frames = shots.each_slice(2).to_a
# [[8, 2], [9, 0], [7, 2], [10, 0], [8, 2], [6, 2], [7, 3], [8, 0], [9, 1]]

point = 0
frames.each do |frame|
  point = point + frame.sum
end
p point
# 84
