# frozen_string_literal: true

require_relative 'input.rb'

class FuncCalculating
  def calculating(value1, value2)
    (Math.sin(value1) - value2) / (value2.abs + Math.cos(value2**2))
  end
end

# data = input
# function_value = FuncCalculating.new()
# puts function_value.calculating(data[0], data[1])
