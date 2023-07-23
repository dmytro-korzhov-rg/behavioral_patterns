# frozen_string_literal: true

module Plans
  class Basic < PricingStrategy
    def calculate_cost(minutes, messages, data)
      minutes_cost = minutes * 0.1
      messages_cost = messages * 0.05
      data_cost = data * 0.02
      minutes_cost + messages_cost + data_cost
    end
  end
end
