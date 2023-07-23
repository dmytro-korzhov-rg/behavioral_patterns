# frozen_string_literal: true

class SecondObserver
  def update(subject)
    puts "Observer2: Subject state changed to #{subject.state}"
  end
end
