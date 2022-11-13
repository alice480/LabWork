# frozen_string_literal: true

require 'rspec'
require_relative 'symbols_calculating.rb'

RSpec.describe SymbolsCalculating do
  context 'testing SymbolsCalculating class whith random count of letters' do
    it 'should print string and count of letters' do
      count_a = rand(10..15)
      count_b = rand(5..10)
      count_c = rand(1..5)
      stroka = 'a' * count_a + 'b' * count_b + 'c' * count_c
      result = SymbolsCalculating.new(stroka)
      result.calculating
      expect(result.give_result).to eq "#{stroka} a #{count_a} b #{count_b} c #{count_c}"
      puts result.give_result
    end
  end
end

RSpec.describe SymbolsCalculating do
  context 'testing SymbolsCalculating class whith random letters and random count of letters' do
    it 'should print count of letters in random string' do
      first_letter = rand(50..75).chr
      second_letter = rand(75..100).chr
      third_letter = rand(100..125).chr
      first_count = rand(1..5)
      second_count = rand(5..10)
      third_count = rand(10..15)
      stroka = first_letter.chr * first_count + second_letter * second_count + third_letter * third_count
      result = SymbolsCalculating.new(stroka)
      result.calculating
      expect(result.give_result).to eq "#{stroka} #{third_letter} #{third_count} " \
                                       "#{second_letter} #{second_count} #{first_letter} #{first_count}"
      puts result.give_result
    end
  end
end

RSpec.describe SymbolsCalculating do
  context 'testing SymbolsCalculating class whith empty string' do
    it 'should print count of letters in random string' do
      result = SymbolsCalculating.new('')
      result.calculating
      expect(result.give_result).to eq ''
      puts result.give_result
    end
  end
end
