module Aoc2023
  class Day09
    def solve(part)
      file = File.join(__dir__, 'input.txt')
      input = File.read(file)
      raise 'Empty input.txt file' if input.empty?

      part == 1 ? part1(input) : part2(input)
    end

    def part1(input)
      do_solve(parse_input(input))
    end

    def part2(input)
      do_solve(parse_input(input).map(&:reverse))
    end

    private

    def do_solve(lines)
      lines.sum do |line|
        last = [line.last]

        until line.sum.zero?
          line = line.each_cons(2).map { |a, b| b - a }
          last << line.last
        end

        last.sum
      end
    end

    # 0 3 6 9 12 15
    # 1 3 6 10 15 21
    # 10 13 16 21 30 45
    def parse_input(input)
      input.lines(chomp: true).map { |line| line.split.map(&:to_i) }
    end
  end
end
