module Aoc2023
  class Day08
    def solve(part)
      file = File.join(__dir__, 'input.txt')
      input = File.read(file)
      raise 'Empty input.txt file' if input.empty?

      part == 1 ? part1(input) : part2(input)
    end

    def part1(input)
      instructions, nodes = parse_input(input)
      count_steps(instructions, nodes, 'AAA')
    end

    def part2(input)
      instructions, nodes = parse_input(input)

      nodes.keys
           .select { |node| node.end_with?('A') }
           .map { |node| count_steps(instructions, nodes, node) }
           .reduce(:lcm)
    end

    private

    def parse_input(input)
      instructions, nodes = input.split("\n\n")
      nodes = nodes.lines(chomp: true).to_h do |line|
        key, values = line.split(' = ')
        values = values.tr('()', '').split(', ')
        [key, { 'L' => values.first, 'R' => values.last }]
      end

      [instructions, nodes]
    end

    def count_steps(instructions, nodes, node)
      i = 0

      until node.end_with?('Z')
        node = nodes[node][instructions[i % instructions.size]]
        i += 1
      end

      i
    end
  end
end
