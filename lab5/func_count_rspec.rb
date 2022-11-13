# frozen_string_literal: true

require 'rspec'
require_relative 'func_counting.rb'

RSpec.describe FuncCalculating do
  context 'testing FuncCalculating class whith two random digits' do
    it 'should print value of function' do
      digit1 = rand(1..20)
      digit2 = rand(-10..10)
      function_value = FuncCalculating.new
      result = (Math.sin(digit1) - digit2) / (digit2.abs + Math.cos(digit2**2))
      expect(function_value.calculating(digit1, digit2)).to eq result
      puts function_value.calculating(digit1, digit2)
    end
  end
end
