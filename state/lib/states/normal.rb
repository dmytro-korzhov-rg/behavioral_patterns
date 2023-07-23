# frozen_string_literal: true

module States
  class Normal < ::State
    def enter_pin(pin)
      puts "Entered PIN: #{pin}. Safe is unlocked."
    end

    def withdraw(amount)
      puts "Withdrew: #{amount} from the safe."
    end

    def deposit(amount)
      puts "Deposited: #{amount} into the safe."
    end
  end
end
