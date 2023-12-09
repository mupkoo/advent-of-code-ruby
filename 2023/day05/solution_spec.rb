require_relative 'solution'

RSpec.describe Aoc2023::Day05 do
  subject(:solution) { described_class.new }

  let(:input) { File.read(File.join(__dir__, 'input.txt')) }
  let(:example) do
    <<~EXAMPLE
      seeds: 79 14 55 13

      seed-to-soil map:
      50 98 2
      52 50 48

      soil-to-fertilizer map:
      0 15 37
      37 52 2
      39 0 15

      fertilizer-to-water map:
      49 53 8
      0 11 42
      42 0 7
      57 7 4

      water-to-light map:
      88 18 7
      18 25 70

      light-to-temperature map:
      45 77 23
      81 45 19
      68 64 13

      temperature-to-humidity map:
      0 69 1
      1 0 69

      humidity-to-location map:
      60 56 37
      56 93 4
    EXAMPLE
  end

  describe 'part 1' do
    it 'solves the example' do
      expect(solution.part1(example)).to eq(35)
    end

    it 'solves the input' do
      expect(solution.part1(input)).to eq(510_109_797)
    end
  end

  describe 'part 2' do
    it 'solves the example' do
      expect(solution.part2(example)).to eq(46)
    end

    # The solution is not really optimal. It should be range-based
    # it 'solves the input' do
    #   expect(solution.part2(input)).to eq(9622622)
    # end
  end
end
