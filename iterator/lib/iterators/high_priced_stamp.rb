# frozen_string_literal: true

module Iterators
  class HighPricedStamp
    def initialize(stamps, threshold)
      @stamps = stamps
      @threshold = threshold
      @current_index = 0
    end

    def has_next?
      @current_index < @stamps.length
    end

    def next
      high_priced_stamps = []
      while @current_index < @stamps.length
        stamp = @stamps[@current_index]
        @current_index += 1
        high_priced_stamps << stamp if stamp.price > @threshold
      end
      high_priced_stamps
    end
  end
end
