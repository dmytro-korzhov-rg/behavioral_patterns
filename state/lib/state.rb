# frozen_string_literal: true

class State
  def enter_pin(_pin)
    raise NotImplementedError, "#{self.class}#enter_pin not implemented"
  end

  def withdraw(_amount)
    raise NotImplementedError, "#{self.class}#withdraw not implemented"
  end

  def deposit(_amount)
    raise NotImplementedError, "#{self.class}#deposit not implemented"
  end
end
