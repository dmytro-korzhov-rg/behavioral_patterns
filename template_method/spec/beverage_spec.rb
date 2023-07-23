# frozen_string_literal: true

require 'rspec'
require_relative '../lib/beverage'
require_relative '../lib/coffee'
require_relative '../lib/tea'

RSpec.describe 'Beverage' do
  describe 'coffee' do
    it 'prepares coffee correctly' do
      coffee = Coffee.new
      expect { coffee.prepare }.to output(
        "Boiling water...\nBrewing coffee...\nPouring into cup...\nAdding sugar and milk...\n"
      ).to_stdout
    end
  end

  describe 'tea' do
    it 'prepares tea correctly' do
      tea = Tea.new
      expect { tea.prepare }.to output(
        "Boiling water...\nBrewing tea...\nPouring into cup...\nAdding lemon...\n"
      ).to_stdout
    end
  end
end
