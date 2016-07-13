require 'readline'
require_relative './calculator'

input = Readline.readline("1から1000の間で任意の数字を入力してください\n> ")

begin
  calculator = Calculator.new
  calculator.remove_number(input)
  result = calculator.extract_removed_number
  puts "あなたが入力した数字は#{result}です"
rescue Calculator::InputValueOutOfRangeError => e
  puts "エラー内容: #{e.message}\n入力結果: #{input}"
rescue => e
  puts "エラー: #{e.class} #{e.message}"
end
