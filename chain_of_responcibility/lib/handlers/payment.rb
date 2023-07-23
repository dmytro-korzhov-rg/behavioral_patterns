# frozen_string_literal: true

module Handlers
  class Payment < Order
    def can_handle?(order)
      order.paid
    end

    def process(order)
      puts "Payment successful. Order #{order.id} successfully accepted and paid."
    end
  end
end
