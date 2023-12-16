require_relative 'solution'

RSpec.describe Aoc2023::Day10 do
  subject(:solution) { described_class.new }

  let(:input) { File.read(File.join(__dir__, 'input.txt')) }

  describe 'part 1' do
    subject(:part1) { solution.part1(example) }

    describe 'simple example' do
      let(:example) do
        <<~EXAMPLE
          ..F7.
          .FJ|.
          SJ.L7
          |F--J
          LJ...
        EXAMPLE
      end

      it { is_expected.to eq(8) }
    end

    it 'solves the input' do
      expect(solution.part1(input)).to eq(6649)
    end
  end

  describe 'part 2' do
    subject(:part2) { solution.part2(example) }

    describe 'example 1' do
      let(:example) do
        <<~EXAMPLE
          ...........
          .S-------7.
          .|F-----7|.
          .||.....||.
          .||.....||.
          .|L-7.F-J|.
          .|..|.|..|.
          .L--J.L--J.
          ...........
        EXAMPLE
      end

      it { is_expected.to eq(4) }
    end

    describe 'example 2' do
      let(:example) do
        <<~EXAMPLE
          ..........
          .S------7.
          .|F----7|.
          .||....||.
          .||....||.
          .|L-7F-J|.
          .|..||..|.
          .L--JL--J.
          ..........
        EXAMPLE
      end

      it { is_expected.to eq(4) }
    end

    describe 'example 3' do
      let(:example) do
        <<~EXAMPLE
          .F----7F7F7F7F-7....
          .|F--7||||||||FJ....
          .||.FJ||||||||L7....
          FJL7L7LJLJ||LJ.L-7..
          L--J.L7...LJS7F-7L7.
          ....F-J..F7FJ|L7L7L7
          ....L7.F7||L7|.L7L7|
          .....|FJLJ|FJ|F7|.LJ
          ....FJL-7.||.||||...
          ....L---J.LJ.LJLJ...
        EXAMPLE
      end

      it { is_expected.to eq(8) }
    end

    describe 'example 4' do
      let(:example) do
        <<~EXAMPLE
          FF7FSF7F7F7F7F7F---7
          L|LJ||||||||||||F--J
          FL-7LJLJ||||||LJL-77
          F--JF--7||LJLJ7F7FJ-
          L---JF-JLJ.||-FJLJJ7
          |F|F-JF---7F7-L7L|7|
          |FFJF7L7F-JF7|JL---7
          7-L-JL7||F7|L7F-7F7|
          L.L7LFJ|||||FJL7||LJ
          L7JLJL-JLJLJL--JLJ.L
        EXAMPLE
      end

      it { is_expected.to eq(10) }
    end

    it 'solves the input' do
      expect(solution.part2(input)).to eq(601)
    end
  end
end
