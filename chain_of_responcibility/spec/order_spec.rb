# frozen_string_literal: true

require 'rspec'
require_relative '../lib/order'
require_relative '../lib/handlers/order'
require_relative '../lib/handlers/auth'
require_relative '../lib/handlers/address'
require_relative '../lib/handlers/payment'

RSpec.describe Handlers::Order do
  let(:user) { 'JohnDoe' }
  let(:delivery_address) { '123 Main St, City' }
  let(:auth_handler) { Handlers::Auth.new }

  context 'AuthHandler' do
    it 'handles order with a user' do
      order = Order.new(1, user, delivery_address, true)
      expect { auth_handler.handle_order(order) }
        .to output("User authenticated. Order 1 successfully accepted.\n").to_stdout
    end

    it 'does not handle order without a user' do
      order = Order.new(2, nil, delivery_address, true)
      expect { auth_handler.handle_order(order) }.to output("Order rejected: does not meet requirements.\n").to_stdout
    end
  end

  context 'AddressHandler' do
    let(:address_handler) { Handlers::Address.new }

    it 'handles order with a delivery address' do
      order = Order.new(3, user, delivery_address, true)
      expect { address_handler.handle_order(order) }
        .to output("Delivery address provided. Order 3 successfully accepted.\n").to_stdout
    end

    it 'does not handle order without a delivery address' do
      order = Order.new(4, user, nil, true)
      expect { address_handler.handle_order(order) }
        .to output("Order rejected: does not meet requirements.\n").to_stdout
    end
  end

  context 'PaymentHandler' do
    let(:payment_handler) { Handlers::Payment.new }

    it 'handles order with successful payment' do
      order = Order.new(5, user, delivery_address, true)
      expect { payment_handler.handle_order(order) }
        .to output("Payment successful. Order 5 successfully accepted and paid.\n").to_stdout
    end

    it 'does not handle order with payment failure' do
      order = Order.new(6, user, delivery_address, false)
      expect { payment_handler.handle_order(order) }
        .to output("Order rejected: does not meet requirements.\n").to_stdout
    end
  end
end
