require 'spec_helper'
require_relative '../lib/calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  describe '#remove_number' do
    subject { calculator.remove_number(input) }

    shared_examples '例外が発生する' do
      it do
        expect { subject }.to raise_error(Calculator::InputValueOutOfRangeError, '1から1000の間で数字を入力してください')
      end
    end

    context '未入力の場合' do
      let(:input) { nil }
      include_examples '例外が発生する'
    end

    context '入力が空文字の場合' do
      let(:input) { '' }
      include_examples '例外が発生する'
    end

    context '入力に数字以外のものが含まれている場合' do
      let(:input) { '-999' }
      include_examples '例外が発生する'
    end

    context '入力が1000を超える場合' do
      let(:input) { '1001' }
      include_examples '例外が発生する'
    end

    context '入力が1から1000の間の数字だった場合' do
      let(:input) { Calculator::THOUSAND_FROM_ONE.sample.to_s }

      it '入力された数字が@dup_numbersから除外される' do
        subject
        expect(calculator.dup_numbers).not_to include input
      end
    end
  end

  describe '#extract_removed_number' do
    let(:expected_number) { Calculator::THOUSAND_FROM_ONE.sample }
    let(:input) { expected_number.to_s }

    before { calculator.remove_number(input) }

    it '除外された数値が結果として返ってくる' do
      subject
      expect(calculator.extract_removed_number).to eq expected_number
    end
  end
end
