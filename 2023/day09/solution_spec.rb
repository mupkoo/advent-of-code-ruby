require_relative 'solution'

RSpec.describe Aoc2023::Day09 do
  subject(:solution) { described_class.new }

  let(:input) { File.read(File.join(__dir__, 'input.txt')) }
  let(:example) do
    <<~EXAMPLE
      0 3 6 9 12 15
      1 3 6 10 15 21
      10 13 16 21 30 45
    EXAMPLE
  end

  describe 'part 1' do
    it 'solves the example' do
      expect(solution.part1(example)).to eq(114)
    end

    it 'solves the input' do
      expect(solution.part1(input)).to eq(1_868_368_343)
    end
  end

  describe 'part 2' do
    it 'solves the example' do
      expect(solution.part2(example)).to eq(2)
    end

    it 'solves the input' do
      expect(solution.part2(input)).to eq(1022)
    end
  end
end
