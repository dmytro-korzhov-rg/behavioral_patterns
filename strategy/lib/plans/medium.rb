# frozen_string_literal: true

module Plans
  class Medium < PricingStrategy
    def calculate_cost(minutes, messages, data)
      minutes_cost = minutes * 0.08
      messages_cost = messages * 0.03
      data_cost = data * 0.015
      minutes_cost + messages_cost + data_cost
    end
  end
end
