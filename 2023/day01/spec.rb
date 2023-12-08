require_relative 'main'

RSpec.describe 'Day 1, 2023' do
  let(:input) { File.read(File.join(__dir__, 'input.txt')) }

  describe 'part 1' do
    let(:example) do
      <<~EXAMPLE
        1asb2
        3asb4
        sa2b3ass4ss
        sda2das
      EXAMPLE
    end

    it 'solves the example' do
      expect(part1(example)).to eq(12 + 34 + 24 + 22)
    end

    it 'solves the input' do
      expect(part1(input)).to eq(55_712)
    end
  end

  describe 'part 2' do
    let(:example) do
      <<~EXAMPLE
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
      EXAMPLE
    end

    it 'solves the example' do
      expect(part2(example)).to eq(281)
    end

    it 'solves the input' do
      expect(part2(input)).to eq(55_413)
    end
  end
end
