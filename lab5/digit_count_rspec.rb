# frozen_string_literal: true

require 'rspec'
require_relative 'digits_count.rb'

RSpec.describe DigitsCount do
  context 'testing DigitsCount' do
    it 'should print count of digits and letters' do
      value = 123
      digits_count = DigitsCount.new(value)
      digits_count.calculating
      expect(digits_count.printing).to eq 'count of digits: 1 count of letters: 1'
    end
  end

  context 'not a number passed' do
    it 'should print 0 ' do
      value = 'adf'
      digits_count2 = DigitsCount.new(value)
      digits_count2.calculating
      expect(digits_count2.printing).to eq 'count of digits: 0 count of letters: 0'
    end
  end
end
