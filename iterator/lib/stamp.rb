# frozen_string_literal: true

class Stamp
  attr_reader :price, :country

  def initialize(price, country)
    @price = price
    @country = country
  end
end
