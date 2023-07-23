# frozen_string_literal: true

require 'rspec'
require_relative '../lib/plans/pricing_strategy'
require_relative '../lib/plans/basic'
require_relative '../lib/plans/medium'
require_relative '../lib/plans/premium'
require_relative '../lib/mobile_plan'

RSpec.describe MobilePlan do
  context 'Basic Plan' do
    it 'calculates the cost correctly' do
      mobile_plan = MobilePlan.new(:basic)
      expect(mobile_plan.calculate_cost(100, 50, 1)).to eq(12.52)
    end
  end

  context 'Medium Plan' do
    it 'calculates the cost correctly' do
      mobile_plan = MobilePlan.new(:medium)
      expect(mobile_plan.calculate_cost(100, 50, 1)).to eq(9.515)
    end
  end

  context 'Premium Plan' do
    it 'calculates the cost correctly' do
      mobile_plan = MobilePlan.new(:premium)
      expect(mobile_plan.calculate_cost(100, 50, 1)).to eq(6.01)
    end
  end

  context 'Invalid Plan' do
    it 'raises an ArgumentError for invalid plan type' do
      expect { MobilePlan.new(:invalid_plan) }.to raise_error(ArgumentError)
    end
  end
end
