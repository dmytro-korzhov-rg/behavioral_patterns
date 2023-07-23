# frozen_string_literal: true

require 'rspec'
require_relative '../lib/notifier'
require_relative '../lib/recipient'
require_relative '../lib/notification_mediator'

RSpec.describe 'Mediator pattern' do
  let(:mediator) { NotificationMediator.new }
  let(:notifier) { Notifier.new(mediator) }
  let(:alice) { Recipient.new('Alice') }
  let(:bob) { Recipient.new('Bob') }

  before do
    mediator.add_recipient(alice)
    mediator.add_recipient(bob)
  end

  it 'sends a notification to all recipients except the sender' do
    expect { notifier.send_notification('Hello, everyone!', alice) }
      .to output("Alice received: Hello, everyone!\n").to_stdout
  end

  it 'does not send a notification to the sender' do
    expect { notifier.send_notification('Hi, Alice!', notifier) }
      .not_to output.to_stdout
  end
end
