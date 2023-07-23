# frozen_string_literal: true

class Square
  attr_reader :side_length

  def initialize(side_length)
    @side_length = side_length
  end

  def accept(visitor)
    visitor.visit_square(self)
  end
end
