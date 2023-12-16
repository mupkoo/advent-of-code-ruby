require_relative 'solution'

RSpec.describe Aoc2023::Day08 do
  subject(:solution) { described_class.new }

  let(:input) { File.read(File.join(__dir__, 'input.txt')) }
  let(:example) do
    <<~EXAMPLE
      RL

      AAA = (BBB, CCC)
      BBB = (DDD, EEE)
      CCC = (ZZZ, GGG)
      DDD = (DDD, DDD)
      EEE = (EEE, EEE)
      GGG = (GGG, GGG)
      ZZZ = (ZZZ, ZZZ)
    EXAMPLE
  end

  describe 'part 1' do
    it 'solves the example' do
      expect(solution.part1(example)).to eq(2)
    end

    it 'solves the input', :input do
      expect(solution.part1(input)).to eq(18_727)
    end
  end

  describe 'part 2' do
    let(:example) do
      <<~EXAMPLE
        LR

        11A = (11B, XXX)
        11B = (XXX, 11Z)
        11Z = (11B, XXX)
        22A = (22B, XXX)
        22B = (22C, 22C)
        22C = (22Z, 22Z)
        22Z = (22B, 22B)
        XXX = (XXX, XXX)
      EXAMPLE
    end

    it 'solves the example' do
      expect(solution.part2(example)).to eq(6)
    end

    it 'solves the input', :input do
      expect(solution.part2(input)).to eq(18_024_643_846_273)
    end
  end
end
