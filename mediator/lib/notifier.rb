# frozen_string_literal: true

class Notifier
  attr_reader :mediator

  def initialize(mediator)
    @mediator = mediator
  end

  def send_notification(message, recipient)
    mediator.send_notification(message, self, recipient)
  end

  def receive_notification(message)
    puts "Received: #{message}"
  end
end
