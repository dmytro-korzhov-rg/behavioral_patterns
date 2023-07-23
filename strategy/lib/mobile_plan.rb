# frozen_string_literal: true

class MobilePlan
  def initialize(plan_type)
    case plan_type
    when :basic
      @pricing_strategy = Plans::Basic.new
    when :medium
      @pricing_strategy = Plans::Medium.new
    when :premium
      @pricing_strategy = Plans::Premium.new
    else
      raise ArgumentError, "Invalid plan type: #{plan_type}"
    end
  end

  def calculate_cost(minutes, messages, data)
    @pricing_strategy.calculate_cost(minutes, messages, data)
  end
end
