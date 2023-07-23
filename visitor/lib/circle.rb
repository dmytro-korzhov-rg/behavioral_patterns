# frozen_string_literal: true

class Circle
  attr_reader :radius

  def initialize(radius)
    @radius = radius
  end

  def accept(visitor)
    visitor.visit_circle(self)
  end
end
