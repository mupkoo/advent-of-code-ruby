require_relative 'solution'

RSpec.describe Aoc2015::Day01 do
  subject(:solution) { described_class.new }

  let(:input) { File.read(File.join(__dir__, 'input.txt')) }

  describe 'part 1' do
    [
      ['(())', 0],
      ['()()', 0],
      ['(((', 3],
      ['(()(()(', 3],
      ['))(((((', 3],
      ['())', -1],
      ['))(', -1],
      [')))', -3],
      [')())())', -3]
    ].each do |example, expected|
      it "solves '#{example}' example" do
        expect(solution.part1(example)).to eq(expected)
      end
    end

    it 'solves the input' do
      expect(solution.part1(input)).to eq(232)
    end
  end

  describe 'part 2' do
    [
      ['(()))', 5],
      ['()())', 5],
      ['))(', 1]
    ].each do |example, expected|
      it "solves '#{example}' example" do
        expect(solution.part2(example)).to eq(expected)
      end
    end

    it 'solves the input' do
      expect(solution.part2(input)).to eq(1783)
    end
  end
end
