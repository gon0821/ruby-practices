# frozen_string_literal: true

require_relative 'frame'

class Game
  def initialize(mark_text)
    marks = mark_text.split(',')
    @frames =
      9.times.map do
        shots = marks[0] == 'X' ? marks.shift(1) : marks.shift(2)
        Frame.new(shots[0], shots[1])
      end
    @frames << Frame.new(marks[0], marks[1], marks[2])
  end

  def calc_score
    @frames.each_with_index.sum do |frame, idx|
      frame.score + (last_frame?(idx) ? 0 : add_bonus(frame, idx))
    end
  end

  def add_bonus(frame, idx)
    if frame.strike?
      @frames[idx + 1].shots[0].score +
        if @frames[idx + 1].strike? && !last_frame?(idx + 1)
          @frames[idx + 2].shots[0].score
        else
          @frames[idx + 1].shots[1].score
        end
    elsif frame.spare?
      @frames[idx + 1].shots[0].score
    else
      0
    end
  end

  def last_frame?(idx)
    idx == 9
  end
end
