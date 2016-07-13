class Calculator
  THOUSAND_FROM_ONE = [*1..1000]

  attr_accessor :shuffle_numbers

  def initialize
    @shuffle_numbers = THOUSAND_FROM_ONE.shuffle
  end

  def remove_number(num)
    fail(InputValueOutOfRangeError, '1から1000の間で数字を入力してください') unless num =~ /^[1-9]\d{0,2}$|1000/
    shuffle_numbers.delete(num.to_i)
  end

  def extract_removed_number
    THOUSAND_FROM_ONE.inject(:+) - shuffle_numbers.inject(:+)
  end

  class InputValueOutOfRangeError < StandardError; end
end

