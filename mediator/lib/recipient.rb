# frozen_string_literal: true

class Recipient
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def receive_notification(message)
    puts "#{name} received: #{message}"
  end
end
