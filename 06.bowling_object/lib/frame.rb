# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :shots

  def initialize(first_mark, second_mark = nil, third_mark = nil)
    @shots = [Shot.new(first_mark), Shot.new(second_mark), Shot.new(third_mark)]
  end

  def calc_score(next_frame, second_next_frame)
    score + (next_frame ? add_bonus(next_frame, second_next_frame) : 0)
  end

  def score
    @shots.sum(&:score)
  end

  def strike?
    @shots[0].score == 10
  end

  def spare?
    !strike? && @shots[0].score + @shots[1].score == 10
  end

  def add_bonus(next_frame, second_next_frame)
    if strike?
      next_frame.shots[0].score +
        if next_frame.strike? && second_next_frame
          second_next_frame.shots[0].score
        else
          next_frame.shots[1].score
        end
    elsif spare?
      next_frame.shots[0].score
    else
      0
    end
  end
end
