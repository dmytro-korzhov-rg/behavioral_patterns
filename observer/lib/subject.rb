# frozen_string_literal: true

class Subject
  attr_reader :state, :observers

  def initialize
    @observers = []
    @state = nil
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def update_state(new_state)
    @state = new_state
    notify_observers
  end

  private

  def notify_observers
    @observers.each { |observer| observer.update(self) }
  end
end
