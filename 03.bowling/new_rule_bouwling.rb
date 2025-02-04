#!/usr/bin/env ruby
require 'debug'

score = ARGV[0]
scores = score.split(',')
# scores = ["8", "2", "1", "0", "2", "3"]

shots = []
scores.each do |i|
  if i == "x"
    shots << 10
    shots << 0
  else
    shots << i.to_i
  end
end

frames = []
shots.each_slice(2) do |i|
  frames << i
end

point = 0
frames.each do |frame|
  if frame[0] == 10
    point += 30
  elsif frame.sum == 10
    point += frame[0] + 10
  else
    point += frame.sum
  end
end

p point
