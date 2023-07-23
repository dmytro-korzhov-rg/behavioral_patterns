# frozen_string_literal: true

module Commands
  class TurnOff < ::Command
    def initialize(tv)
      @tv = tv
    end

    def execute
      @tv.turn_off
    end

    def undo
      @tv.turn_on
    end
  end
end
