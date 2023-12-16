require_relative 'solution'

RSpec.describe Aoc2015::Day03 do
  subject(:solution) { described_class.new }

  let(:input) { File.read(File.join(__dir__, 'input.txt')) }

  describe 'part 1' do
    [
      ['>', 2],
      ['^>v<', 4],
      ['^v^v^v^v^v', 2]
    ].each do |example, expected|
      it "solves '#{example}' example" do
        expect(solution.part1(example)).to eq(expected)
      end
    end

    it 'solves the input', :input do
      expect(solution.part1(input)).to eq(2081)
    end
  end

  describe 'part 2' do
    [
      ['^>', 3],
      ['^>v<', 3],
      ['^v^v^v^v^v', 11]
    ].each do |example, expected|
      it "solves '#{example}' example" do
        expect(solution.part2(example)).to eq(expected)
      end
    end

    it 'solves the input', :input do
      expect(solution.part2(input)).to eq(2341)
    end
  end
end
