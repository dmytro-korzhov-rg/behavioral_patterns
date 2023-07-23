# frozen_string_literal: true

require_relative '../lib/subject'
require_relative '../lib/first_observer'
require_relative '../lib/second_observer'

RSpec.describe Subject do
  let(:subject) { Subject.new }
  let(:observer1) { FirstObserver.new }
  let(:observer2) { SecondObserver.new }

  it 'notifies observers when state changes' do
    subject.add_observer(observer1)
    subject.add_observer(observer2)

    expect { subject.update_state('new state') }
      .to output("Observer1: Subject state changed to new state\nObserver2: Subject state changed to new state\n")
      .to_stdout
  end

  it 'does not notify removed observers' do
    subject.add_observer(observer1)
    subject.add_observer(observer2)
    subject.remove_observer(observer1)

    expect { subject.update_state('new state') }
      .to output("Observer2: Subject state changed to new state\n")
      .to_stdout
  end
end
