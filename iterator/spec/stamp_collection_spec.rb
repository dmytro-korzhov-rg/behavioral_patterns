# frozen_string_literal: true

require 'rspec'
require_relative '../lib/stamp'
require_relative '../lib/stamp_collection'
require_relative '../lib/iterators/country_stamp'
require_relative '../lib/iterators/high_priced_stamp'
require 'pry'

RSpec.describe 'StampCollection' do
  let(:stamp_collection) { StampCollection.new }

  before(:each) do
    stamp_collection.add_stamp(Stamp.new(10, 'USA'))
    stamp_collection.add_stamp(Stamp.new(15, 'UK'))
    stamp_collection.add_stamp(Stamp.new(5, 'Germany'))
    stamp_collection.add_stamp(Stamp.new(20, 'USA'))
  end

  describe '#each_high_priced' do
    it 'returns stamps with a price higher than the specified one' do
      high_priced_stamps = []
      stamp_collection.each_high_priced(10) { |stamp| high_priced_stamps << stamp }
      expect(high_priced_stamps.flatten.map(&:price)).to eq([15, 20])
    end

    it 'does not return stamps with a price less than or equal to the specified' do
      high_priced_stamps = []
      stamp_collection.each_high_priced(25) { |stamp| high_priced_stamps << stamp }
      expect(high_priced_stamps.flatten).to be_empty
    end
  end

  describe '#each_from_country' do
    it 'returns stamps from the specified country' do
      stamps_from_usa = []
      stamp_collection.each_from_country('USA') { |stamp| stamps_from_usa << stamp }
      expect(stamps_from_usa.flatten.map(&:country)).to eq(%w[USA USA])
    end

    it 'does not return stamps from other countries' do
      stamps_from_uk = []
      stamp_collection.each_from_country('UK') { |stamp| stamps_from_uk << stamp }
      expect(stamps_from_uk.flatten.map(&:country)).to eq(['UK'])
    end
  end
end
