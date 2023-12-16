require_relative 'solution'

RSpec.describe Aoc2015::Day02 do
  subject(:solution) { described_class.new }

  let(:input) { File.read(File.join(__dir__, 'input.txt')) }
  let(:example) do
    <<~EXAMPLE
      2x3x4
      1x1x10
    EXAMPLE
  end

  describe 'part 1' do
    it 'solves the example' do
      expect(solution.part1(example)).to eq(58 + 43)
    end

    it 'solves the input' do
      expect(solution.part1(input)).to eq(1_606_483)
    end
  end

  describe 'part 2' do
    it 'solves the example' do
      expect(solution.part2(example)).to eq(34 + 14)
    end

    it 'solves the input' do
      expect(solution.part2(input)).to eq(3_842_356)
    end
  end
end
