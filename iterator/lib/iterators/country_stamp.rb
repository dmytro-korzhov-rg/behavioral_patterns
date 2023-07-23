# frozen_string_literal: true

module Iterators
  class CountryStamp
    def initialize(stamps, country)
      @stamps = stamps
      @country = country
      @current_index = 0
    end

    def has_next?
      @current_index < @stamps.length
    end

    def next
      stamps_from_country = []
      while @current_index < @stamps.length
        stamp = @stamps[@current_index]
        @current_index += 1
        stamps_from_country << stamp if stamp.country == @country
      end
      stamps_from_country
    end
  end
end
