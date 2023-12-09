module Aoc2023
  class Day04
    def solve(part)
      file = File.join(__dir__, 'input.txt')
      input = File.read(file)
      raise 'Empty input.txt file' if input.empty?

      part == 1 ? part1(input) : part2(input)
    end

    def part1(input)
      parse_input(input).sum do |(winning, picked)|
        matches = winning.count { |number| picked.include?(number) }
        matches.positive? ? 1 * (2**(matches - 1)) : 0
      end
    end

    def part2(input)
      won = Hash.new(0)

      parse_input(input).each_with_index.sum do |(winning, picked), index|
        won[index] += 1
        next_index = 0

        winning.each do |number|
          next unless picked.include?(number)

          next_index += 1
          won[index + next_index] += won[index]
        end

        won[index]
      end
    end

    private

    # Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
    # Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
    def parse_input(input)
      input.lines(chomp: true).map do |line|
        winning, picked = line.split(': ').last.split(' | ')
        [winning.split.map(&:to_i), picked.split.map(&:to_i)]
      end
    end
  end
end
