# frozen_string_literal: true

class NotificationMediator
  def initialize
    @recipients = []
  end

  def add_recipient(recipient)
    @recipients << recipient
  end

  def send_notification(message, sender, target_recipient)
    @recipients.each do |recipient|
      next if recipient == sender || recipient != target_recipient

      recipient.receive_notification(message)
    end
  end
end
