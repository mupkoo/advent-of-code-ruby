module Aoc2023
  class Day02
    def solve(part)
      file = File.join(__dir__, 'input.txt')
      input = File.read(file)
      raise 'Empty input.txt file' if input.empty?

      part == 1 ? part1(input) : part2(input)
    end

    # only 12 red cubes, 13 green cubes, and 14 blue cubes
    def part1(input)
      parse_input(input).each_with_index.sum do |games, index|
        is_valid = games.all? do |game|
          game.fetch('red', 0) <= 12 && game.fetch('green', 0) <= 13 && game.fetch('blue', 0) <= 14
        end
        is_valid ? index + 1 : 0
      end
    end

    def part2(input)
      parse_input(input).sum do |games|
        result = games.each_with_object({ 'red' => 0, 'green' => 0, 'blue' => 0 }) do |game, acc|
          game.each { |color, count| acc[color] = [count, acc[color]].max }
        end

        result.values.reduce(:*)
      end
    end

    private

    # Example:
    # Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
    # Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
    def parse_input(input)
      input.lines(chomp: true).map do |line|
        line.split(': ').last.split('; ').map do |game|
          game.split(', ').to_h do |cube|
            count, color = cube.split

            [color, count.to_i]
          end
        end
      end
    end
  end
end
