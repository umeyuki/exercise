class Calculator
  MAX_NUMBER = 1000
  THOUSAND_FROM_ONE = [*1..1000].shuffle

  attr_accessor :dup_numbers, :total

  def initialize
    @dup_numbers = THOUSAND_FROM_ONE.dup
    @total = THOUSAND_FROM_ONE.inject(:+)
  end

  def remove_number(num)
    if num.nil? || num == '' || !num.between?(1, MAX_NUMBER)
      fail(InputValueOutOfRangeError, '1から1000の間で数字を入力してください')
    end
    dup_numbers.delete(num.to_i)
  end

  def extract_removed_number_with_loop
    THOUSAND_FROM_ONE.each_with_index do |number, i|
      return number if number != dup_numbers[i]
    end
  end

  def extract_removed_number_with_inject
    total - dup_numbers.inject(:+)
  end

  alias_method :extract_removed_number, :extract_removed_number_with_inject
  class InputValueOutOfRangeError < StandardError; end
end
