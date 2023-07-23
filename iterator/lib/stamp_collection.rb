# frozen_string_literal: true

class StampCollection
  def initialize
    @stamps = []
  end

  def add_stamp(stamp)
    @stamps << stamp
  end

  def each_high_priced(threshold)
    iterator = Iterators::HighPricedStamp.new(@stamps, threshold)
    yield iterator.next while iterator.has_next?
  end

  def each_from_country(country)
    iterator = Iterators::CountryStamp.new(@stamps, country)
    yield iterator.next while iterator.has_next?
  end
end
