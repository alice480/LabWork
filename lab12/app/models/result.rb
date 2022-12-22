# frozen_string_literal: true

# class for working with postgres database
class Result < ApplicationRecord
  validates :key, numericality: { greater_than: 0, less_than: 101 }
  before_save :count_result

  def count_result
    self.squared = (1..key.to_i).each.select { |num| num if automorph?(num.to_i) }.map { |i| [i, i**2] }
  end

  def automorph?(number)
    squared = (number**2).to_s
    squared[squared.length - number.to_s.length..squared.length - 1] == number.to_s
  end
end
