# frozen_string_literal: true

require 'rspec'
require_relative '../lib/safe'
require_relative '../lib/state'
require_relative '../lib/states/hacked'
require_relative '../lib/states/locked'
require_relative '../lib/states/normal'

RSpec.describe Safe do
  let(:pin) { 1234 }
  subject(:safe) { Safe.new(pin) }

  context 'when in NormalState' do
    it 'opens the safe with the correct PIN' do
      expect { safe.enter_pin(pin) }.to output(/Entered PIN: #{pin}. Safe is unlocked./).to_stdout
    end

    it 'withdraws money from the safe' do
      expect { safe.withdraw(100) }.to output(/Withdrew: 100 from the safe./).to_stdout
    end

    it 'deposits money into the safe' do
      expect { safe.deposit(200) }.to output(/Deposited: 200 into the safe./).to_stdout
    end
  end

  context 'when in HackedState' do
    before { safe.state = States::Hacked.new }

    it 'unlocks the safe without a PIN' do
      expect { safe.enter_pin(9999) }.to output(/Hacked! Safe is unlocked./).to_stdout
    end

    it 'prevents withdrawal' do
      expect { safe.withdraw(100) }.to output(/Can't withdraw. Safe is hacked./).to_stdout
    end

    it 'prevents deposit' do
      expect { safe.deposit(200) }.to output(/Can't deposit. Safe is hacked./).to_stdout
    end
  end

  context 'when in LockedState' do
    before { safe.state = States::Locked.new }

    it 'does not unlock the safe with the correct PIN' do
      expect { safe.enter_pin(pin) }.to output(/Can't enter PIN. Safe is locked./).to_stdout
    end

    it 'prevents withdrawal' do
      expect { safe.withdraw(100) }.to output(/Can't withdraw. Safe is locked./).to_stdout
    end

    it 'prevents deposit' do
      expect { safe.deposit(200) }.to output(/Can't deposit. Safe is locked./).to_stdout
    end
  end
end
