# frozen_string_literal: true

module Commands
  class ChangeChannel < ::Command
    def initialize(tv, channel)
      @tv = tv
      @channel = channel
      @previous_channel = nil
    end

    def execute
      @previous_channel = current_channel
      @tv.change_channel(@channel)
    end

    def undo
      @tv.change_channel(@previous_channel)
    end

    private

    def current_channel
      'previous_channel'
    end
  end
end
