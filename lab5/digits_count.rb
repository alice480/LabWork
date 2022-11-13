# frozen_string_literal: true

# this class calculting the count of digits in hexadecimal number
class DigitsCount
  def initialize(value)
    @value = ''
    @value = value.to_i.to_s(16).split('') if checking(value)
    @count_of_digits = 0
  end

  def checking(symbol)
    !Float(symbol).nil?
  rescue StandardError
    false
  end

  def calculating
    return unless @value.is_a?(Array)
    @count_of_digits += @value.map { |symbol| symbol = checking(symbol) ? 1 : 0}.sum
    # @value.each do |symbol|
    #   @count_of_digits += 1 if checking(symbol)
    #end
  end

  def printing
    result = "count of digits: #{@count_of_digits} count of letters: #{@value.length - @count_of_digits}"
    puts result
    result
  end
end

value = gets
digits_count = DigitsCount.new(value)
digits_count.calculating
digits_count.printing
