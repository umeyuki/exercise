require "benchmark"
require_relative "lib/calculator"

try_count = 10000

Benchmark.bm 10 do |r|
  r.report "#with_with" do
    try_count.times do
      calculator = Calculator.new
      calculator.remove_number([*1..Calculator::MAX_NUMBER].sample)
      calculator.extract_removed_number_with_loop
    end
  end
  r.report "#with_inject" do
    try_count.times do
      calculator = Calculator.new
      calculator.remove_number([*1..Calculator::MAX_NUMBER].sample)
      calculator.extract_removed_number_with_inject
    end
  end
end
