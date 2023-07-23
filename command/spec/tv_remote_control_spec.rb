# frozen_string_literal: true

require 'rspec'
require_relative '../lib/tv'
require_relative '../lib/command'
require_relative '../lib/commands/turn_on'
require_relative '../lib/commands/turn_off'
require_relative '../lib/commands/change_channel'
require_relative '../lib/remote_control'

RSpec.describe 'TV Remote Control' do
  let(:tv) { Tv.new }
  let(:turn_on_command) { Commands::TurnOn.new(tv) }
  let(:turn_off_command) { Commands::TurnOff.new(tv) }
  let(:first_change_channel_command) { Commands::ChangeChannel.new(tv, 'Channel 1') }
  let(:second_change_channel_command) { Commands::ChangeChannel.new(tv, 'Channel 2') }
  let(:remote_control) { RemoteControl.new }

  it 'turns on the TV' do
    expect { turn_on_command.execute }.to output("TV is ON\n").to_stdout
  end

  it 'turns off the TV' do
    expect { turn_off_command.execute }.to output("TV is OFF\n").to_stdout
  end

  it 'changes to Channel 1' do
    expect { first_change_channel_command.execute }.to output("Channel changed to Channel 1\n").to_stdout
  end

  it 'changes to Channel 2' do
    expect { second_change_channel_command.execute }.to output("Channel changed to Channel 2\n").to_stdout
  end

  it 'undos turn on command' do
    remote_control.set_on_command(turn_on_command)
    remote_control.press_on_button
    remote_control.press_undo_button
    expect { turn_on_command.undo }.to output("TV is OFF\n").to_stdout
  end

  it 'undos turn off command' do
    remote_control.set_off_command(turn_off_command)
    remote_control.press_off_button
    remote_control.press_undo_button
    expect { turn_off_command.undo }.to output("TV is ON\n").to_stdout
  end

  it 'undos change channel command' do
    remote_control.set_channel_command('Channel 1', first_change_channel_command)
    remote_control.set_channel_command('Channel 2', second_change_channel_command)
    remote_control.press_channel_button('Channel 1')
    remote_control.press_channel_button('Channel 2')
    remote_control.press_undo_button
    expect { second_change_channel_command.undo }.to output("Channel changed to previous_channel\n").to_stdout
  end
end
