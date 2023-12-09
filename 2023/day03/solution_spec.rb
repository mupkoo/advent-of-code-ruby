require_relative 'solution'

RSpec.describe Aoc2023::Day03 do
  subject(:solution) { described_class.new }

  let(:input) { File.read(File.join(__dir__, 'input.txt')) }
  let(:example) do
    <<~EXAMPLE
      467..114..
      ...*......
      ..35..633.
      ......#...
      617*......
      .....+.58.
      ..592.....
      ......755.
      ...$.*....
      .664.598..
    EXAMPLE
  end

  describe 'part 1' do
    it 'solves the example' do
      expect(solution.part1(example)).to eq(4361)
    end

    it 'solves the input' do
      expect(solution.part1(input)).to eq(522_726)
    end
  end

  describe 'part 2' do
    it 'solves the example' do
      expect(solution.part2(example)).to eq(467_835)
    end

    it 'solves the input' do
      expect(solution.part2(input)).to eq(81_721_933)
    end
  end
end
