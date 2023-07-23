# frozen_string_literal: true

module Commands
  class TurnOn < ::Command
    def initialize(tv)
      @tv = tv
    end

    def execute
      @tv.turn_on
    end

    def undo
      @tv.turn_off
    end
  end
end
