# frozen_string_literal: true

require 'rspec'
require_relative '../lib/area_and_perimeter_visitor'
require_relative '../lib/circle'
require_relative '../lib/square'

RSpec.describe 'Visitor Pattern' do
  it 'calculates area and perimeter for circle' do
    circle = Circle.new(5)
    visitor = AreaAndPerimeterVisitor.new

    result = circle.accept(visitor)

    expect(result[:area]).to eq(78.53981633974483)
    expect(result[:perimeter]).to eq(31.41592653589793)
  end

  it 'calculates area and perimeter for square' do
    square = Square.new(4)
    visitor = AreaAndPerimeterVisitor.new

    result = square.accept(visitor)

    expect(result[:area]).to eq(16)
    expect(result[:perimeter]).to eq(16)
  end
end
