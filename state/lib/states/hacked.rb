# frozen_string_literal: true

module States
  class Hacked < ::State
    def enter_pin(_pin)
      puts 'Hacked! Safe is unlocked.'
    end

    def withdraw(_amount)
      puts "Can't withdraw. Safe is hacked."
    end

    def deposit(_amount)
      puts "Can't deposit. Safe is hacked."
    end
  end
end
