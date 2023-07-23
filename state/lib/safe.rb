# frozen_string_literal: true

class Safe
  attr_reader :pin
  attr_accessor :state

  def initialize(pin)
    @pin = pin
    @state = States::Normal.new
  end

  def enter_pin(pin)
    @state.enter_pin(pin)
    change_state_to(States::Normal.new)
  end

  def withdraw(amount)
    @state.withdraw(amount)
  end

  def deposit(amount)
    @state.deposit(amount)
  end

  private

  def change_state_to(new_state)
    @state = new_state
  end
end
