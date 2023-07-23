# frozen_string_literal: true

module Handlers
  class Auth < Order
    def can_handle?(order)
      !order.user.nil?
    end

    def process(order)
      puts "User authenticated. Order #{order.id} successfully accepted."
    end
  end
end
