# frozen_string_literal: true

require_relative 'frame'

class Game
  def initialize(mark_text)
    marks = mark_text.split(',')
    @frames =
      Array.new(9) do
        shots = marks[0] == 'X' ? marks.shift(1) : marks.shift(2)
        Frame.new(shots[0], shots[1])
      end
    @frames << Frame.new(marks[0], marks[1], marks[2])
  end

  def calc_score
    @frames.each_with_index.sum do |frame, idx|
      next_frame = @frames[idx + 1]
      second_next_frame = @frames[idx + 2]
      frame.calc_score(next_frame, second_next_frame)
    end
  end
end
