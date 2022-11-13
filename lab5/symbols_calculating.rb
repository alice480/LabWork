# frozen_string_literal: true

# this class calculating the count of symbols
class SymbolsCalculating
  def initialize(stroka)
    @stroka = stroka
  end

  def calculating
    @letters = {}
    @stroka.split.each do |elem|
      elem.split('').each do |symbol|
        if @letters.key?(symbol)
          @letters[symbol] += 1
        else
          @letters[symbol] = 1
        end
      end
    end
  end

  def give_result
    result = ''
    @letters.sort_by { |_key, value| value }.reverse.each { |elem| result += " #{elem[0]} #{String(elem[1])}" }
    result = @stroka + result
  end
end
