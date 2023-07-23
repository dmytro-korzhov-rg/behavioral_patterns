# frozen_string_literal: true

module States
  class Locked < ::State
    def enter_pin(_pin)
      puts "Can't enter PIN. Safe is locked."
    end

    def withdraw(_amount)
      puts "Can't withdraw. Safe is locked."
    end

    def deposit(_amount)
      puts "Can't deposit. Safe is locked."
    end
  end
end
