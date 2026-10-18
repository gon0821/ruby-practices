# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :shots

  def initialize(first_mark, second_mark = nil, third_mark = nil)
    @shots = [Shot.new(first_mark), Shot.new(second_mark), Shot.new(third_mark)]
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
end
