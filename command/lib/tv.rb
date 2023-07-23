# frozen_string_literal: true

class Tv
  def turn_on
    puts 'TV is ON'
  end

  def turn_off
    puts 'TV is OFF'
  end

  def change_channel(channel)
    puts "Channel changed to #{channel}"
  end
end
