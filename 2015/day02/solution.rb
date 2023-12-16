module Aoc2015
  class Day02
    def solve(part)
      file = File.join(__dir__, 'input.txt')
      input = File.read(file)
      raise 'Empty input.txt file' if input.empty?

      part == 1 ? part1(input) : part2(input)
    end

    def part1(input)
      parse_input(input).reduce(0) do |sum, (l, w, h)|
        sides = [l * w, w * h, h * l]
        sum + (sides.sum * 2) + sides.min
      end
    end

    def part2(input)
      parse_input(input).reduce(0) do |sum, dimensions|
        sum + (dimensions.min(2).sum * 2) + dimensions.reduce(:*)
      end
    end

    private

    def parse_input(input)
      input.lines(chomp: true).map { |line| line.split('x').map(&:to_i) }
    end
  end
end
