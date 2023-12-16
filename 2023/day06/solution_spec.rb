require_relative 'solution'

RSpec.describe Aoc2023::Day06 do
  subject(:solution) { described_class.new }

  let(:input) { File.read(File.join(__dir__, 'input.txt')) }
  let(:example) do
    <<~EXAMPLE
      Time:      7  15   30
      Distance:  9  40  200
    EXAMPLE
  end

  describe 'part 1' do
    it 'solves the example' do
      expect(solution.part1(example)).to eq(288)
    end

    it 'solves the input', :input do
      expect(solution.part1(input)).to eq(449_820)
    end
  end

  describe 'part 2' do
    it 'solves the example' do
      expect(solution.part2(example)).to eq(71_503)
    end

    it 'solves the input', :input do
      expect(solution.part2(input)).to eq(42_250_895)
    end
  end
end
