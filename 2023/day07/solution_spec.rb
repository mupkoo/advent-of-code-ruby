require_relative 'solution'

RSpec.describe Aoc2023::Day07 do
  subject(:solution) { described_class.new }

  let(:input) { File.read(File.join(__dir__, 'input.txt')) }
  let(:example) do
    <<~EXAMPLE
      32T3K 765
      T55J5 684
      KK677 28
      KTJJT 220
      QQQJA 483
    EXAMPLE
  end

  describe 'part 1' do
    it 'solves the example' do
      expect(solution.part1(example)).to eq(6440)
    end

    it 'solves the input' do
      expect(solution.part1(input)).to eq(250_951_660)
    end
  end

  describe 'part 2' do
    let(:example) do
      <<~EXAMPLE
        32T3K 765
        T55J5 684
        KK677 28
        KTJJT 220
        QQQJA 483
      EXAMPLE
    end

    it 'solves the example' do
      expect(solution.part2(example)).to eq(5905)
    end

    it 'solves the input' do
      expect(solution.part2(input)).to eq(251_481_660)
    end
  end
end
