module Aoc2015
  class Day01
    def solve(part)
      file = File.join(__dir__, 'input.txt')
      input = File.read(file)
      raise 'Empty input.txt file' if input.empty?

      part == 1 ? part1(input) : part2(input)
    end

    def part1(input)
      input.chars.sum { |char| char == '(' ? 1 : -1 }
    end

    def part2(input)
      sum = 0

      input.chars.each_with_index do |char, index|
        sum += char == '(' ? 1 : -1
        return index + 1 if sum.negative?
      end
    end
  end
end
