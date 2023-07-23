# frozen_string_literal: true

class AreaAndPerimeterVisitor
  def visit_circle(circle)
    area = Math::PI * (circle.radius**2)
    perimeter = 2 * Math::PI * circle.radius

    { area:, perimeter: }
  end

  def visit_square(square)
    area = square.side_length**2
    perimeter = 4 * square.side_length

    { area:, perimeter: }
  end
end
