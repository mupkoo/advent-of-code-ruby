module Aoc2023
  class Day05
    def solve(part)
      file = File.join(__dir__, 'input.txt')
      input = File.read(file)
      raise 'Empty input.txt file' if input.empty?

      part == 1 ? part1(input) : part2(input)
    end

    def part1(input)
      seeds, maps = parse_input(input)

      seeds.map { |seed| find_location(seed, maps) }.min
    end

    def part2(input)
      seeds, maps = parse_input(input)

      seeds.each_slice(2).map do |(seed, range)|
        (seed..seed + range).map { |s| find_location(s, maps) }.min
      end.min
    end

    private

    # seeds: 79 14 55 13
    #
    # seed-to-soil map:
    # 50 98 2
    # 52 50 48
    def parse_input(input)
      seeds, *rest = input.split("\n\n")
      seeds = seeds.split(': ').last.split.map(&:to_i)
      maps = rest.map do |map|
        map.lines(chomp: true).drop(1).map { |line| line.split.map(&:to_i) }
      end

      [seeds, maps]
    end

    def find_location(seed, maps)
      maps.each do |map|
        map.each do |(dest, src, range)|
          if (src..src + range).cover?(seed)
            seed = seed - src + dest
            break
          end
        end
      end

      seed
    end
  end
end
