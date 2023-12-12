module Aoc2023
  class Day06
    def solve(part)
      file = File.join(__dir__, 'input.txt')
      input = File.read(file)
      raise 'Empty input.txt file' if input.empty?

      part == 1 ? part1(input) : part2(input)
    end

    # Time:      7  15   30
    # Distance:  9  40  200
    def part1(input)
      time, distance = parse_input(input)
      games = time.split(': ').last.split.map(&:to_i).zip(
        distance.split(': ').last.split.map(&:to_i)
      )

      do_solve(games)
    end

    # Time:      7  15   30
    # Distance:  9  40  200
    def part2(input)
      time, distance = parse_input(input)
      game = [
        time.split(': ').last.gsub(' ', '').to_i,
        distance.split(': ').last.gsub(' ', '').to_i
      ]

      do_solve([game])
    end

    private

    def do_solve(games)
      games.map do |(time, distance)|
        count = 0

        time.times do |t|
          if (time - t) * t > distance
            count += 1
          elsif count.positive?
            break
          end
        end

        count
      end.reduce(:*)
    end

    def parse_input(input)
      input.lines(chomp: true)
    end
  end
end
