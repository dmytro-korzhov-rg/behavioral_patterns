# frozen_string_literal: true

class Order
  attr_reader :id, :user, :delivery_address, :paid

  def initialize(id, user, delivery_address, paid)
    @id = id
    @user = user
    @delivery_address = delivery_address
    @paid = paid
  end
end
