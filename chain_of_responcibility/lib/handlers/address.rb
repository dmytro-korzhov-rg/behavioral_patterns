# frozen_string_literal: true

module Handlers
  class Address < Order
    def can_handle?(order)
      !order.delivery_address.nil?
    end

    def process(order)
      puts "Delivery address provided. Order #{order.id} successfully accepted."
    end
  end
end
