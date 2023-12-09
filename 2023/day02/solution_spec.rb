require_relative 'solution'

RSpec.describe Aoc2023::Day02 do
  subject(:solution) { described_class.new }

  let(:input) { File.read(File.join(__dir__, 'input.txt')) }
  let(:example) do
    <<~EXAMPLE
      Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
      Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
      Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
      Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
      Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
    EXAMPLE
  end

  describe 'part 1' do
    it 'solves the example' do
      expect(solution.part1(example)).to eq(8)
    end

    it 'solves the input' do
      expect(solution.part1(input)).to eq(2476)
    end
  end

  describe 'part 2' do
    it 'solves the example' do
      expect(solution.part2(example)).to eq(2286)
    end

    it 'solves the input' do
      expect(solution.part2(input)).to eq(54_911)
    end
  end
end
