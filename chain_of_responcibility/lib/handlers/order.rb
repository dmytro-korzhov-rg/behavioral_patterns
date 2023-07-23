# frozen_string_literal: true

module Handlers
  class Order
    attr_accessor :successor

    def handle_order(order)
      if can_handle?(order)
        process(order)
      elsif @successor
        @successor.handle_order(order)
      else
        puts 'Order rejected: does not meet requirements.'
      end
    end

    def can_handle?(order)
      raise NotImplementedError, "Subclasses must implement the 'can_handle?' method."
    end

    def process(order)
      raise NotImplementedError, "Subclasses must implement the 'process' method."
    end
  end
end
