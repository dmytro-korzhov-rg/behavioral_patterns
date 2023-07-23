# frozen_string_literal: true

class RemoteControl
  def initialize
    @on_command = nil
    @off_command = nil
    @change_channel_commands = {}
  end

  def set_on_command(command)
    @on_command = command
  end

  def set_off_command(command)
    @off_command = command
  end

  def set_channel_command(channel, command)
    @change_channel_commands[channel] = command
  end

  def press_on_button
    @on_command&.execute
  end

  def press_off_button
    @off_command&.execute
  end

  def press_channel_button(channel)
    command = @change_channel_commands[channel]
    command&.execute
  end

  def press_undo_button
    @on_command&.undo
    @off_command&.undo
    @change_channel_commands.each_value(&:undo)
  end
end
