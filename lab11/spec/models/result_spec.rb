# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Result, type: :model do
  let!(:correct_number) { 70 }
  let!(:correct_number_not_in_results) { 15 }
  let!(:incorrect_number) { -10 }
  let!(:incorrect_symbol) { 'asdsa' }
  let!(:correct_result_with_correct_number) { [[1, 1], [5, 25], [6, 36], [25, 625]] }
  let(:some_correct_input) { Result.create!({ key: correct_number }) }
  let(:some_correct_input_clone) { Result.create!({ key: correct_number }) }
  let(:some_incorrect_number_input) { Result.new({ key: incorrect_number }) }
  let(:some_incorrect_symbol_input) { Result.new({ key: incorrect_symbol }) }

  it 'has calculates correctly' do
    expect(some_correct_input.squared).to eq correct_result_with_correct_number
  end

  it 'has record after create with correct input' do
    some_correct_input
    expect(described_class.find_by(key: correct_number).squared).to eq correct_result_with_correct_number
  end

  it 'has no record while record is not created' do
    expect(described_class.find_by(key: correct_number_not_in_results)).to eq nil
  end

  it 'returns error when incorrect number given' do
    expect(some_incorrect_number_input.valid?).to eq false
    expect(some_incorrect_number_input.errors.size).to be > 0
  end

  it 'returns error when symbol given' do
    expect(some_incorrect_symbol_input.valid?).to eq false
    expect(some_incorrect_symbol_input.errors.size).to be > 0
  end
end
