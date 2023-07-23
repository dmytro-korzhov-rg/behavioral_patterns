# frozen_string_literal: true

module Plans
  class PricingStrategy
    def calculate_cost(minutes, messages, data)
      raise NotImplementedError, "Subclasses must implement the 'calculate_cost' method."
    end
  end
end
