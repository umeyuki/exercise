class Calculator
  THOUSAND_FROM_ONE = [*1..1000].shuffle

  attr_accessor :dup_numbers

  def initialize
    @dup_numbers = THOUSAND_FROM_ONE.dup
  end

  def remove_number(num)
    fail(InputValueOutOfRangeError, '1から1000の間で数字を入力してください') unless num =~ /^[1-9]\d{0,2}$|1000/
    dup_numbers.delete(num.to_i)
  end

  def extract_removed_number
    THOUSAND_FROM_ONE.each_with_index do |number, i|
      return number if number != dup_numbers[i]
    end
  end

  class InputValueOutOfRangeError < StandardError; end
end

