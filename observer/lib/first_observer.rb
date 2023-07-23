# frozen_string_literal: true

class FirstObserver
  def update(subject)
    puts "Observer1: Subject state changed to #{subject.state}"
  end
end
