# frozen_string_literal: true

module Plans
  class Premium < PricingStrategy
    def calculate_cost(minutes, messages, data)
      minutes_cost = minutes * 0.05
      messages_cost = messages * 0.02
      data_cost = data * 0.01
      minutes_cost + messages_cost + data_cost
    end
  end
end
