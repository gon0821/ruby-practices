#!/usr/bin/env ruby
# frozen_string_literal: true

params = ARGV[0]
scores = params.split(',')

shots = []
scores.each do |score|
  if score == 'X'
    shots << 10
    shots << 0
  else
    shots << score.to_i
  end
end

frames = shots.each_slice(2).to_a

point = 0

frames.each_with_index do |frame, i|
  point += frame.sum
  if frame[0] == 10
    point += frames[i + 1][0] + (frames[i + 1][0] == 10 ? frames[i + 2][0] : frames[i + 1][1])
  elsif frame.sum == 10
    point += frames[i + 1][0]
  end
  break if i == 9
end

puts point
