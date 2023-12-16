module Aoc2015
  class Day03
    def solve(part)
      file = File.join(__dir__, 'input.txt')
      input = File.read(file)
      raise 'Empty input.txt file' if input.empty?

      part == 1 ? part1(input) : part2(input)
    end

    def part1(input)
      Router.new.process(parse_input(input)).size
    end

    def part2(input)
      santa, robot = parse_input(input).partition.with_index { |_, i| i.even? }
      Router.new.process(santa).process(robot).size
    end

    private

    def parse_input(input)
      input.chars
    end

    class Router
      MOVEMENTS = { '^' => [0, 1], 'v' => [0, -1], '>' => [1, 0], '<' => [-1, 0] }.freeze

      attr_reader :houses

      def initialize
        @houses = Set.new
      end

      def process(route)
        position = [0, 0]
        houses.add(position.join('-'))

        route.each do |dir|
          position[0] += MOVEMENTS[dir][0]
          position[1] += MOVEMENTS[dir][1]

          houses.add(position.join('-'))
        end
        self
      end

      def size
        houses.size
      end
    end
  end
end
