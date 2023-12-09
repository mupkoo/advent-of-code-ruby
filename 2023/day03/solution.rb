module Aoc2023
  class Day03
    def solve(part)
      file = File.join(__dir__, 'input.txt')
      input = File.read(file)
      raise 'Empty input.txt file' if input.empty?

      part == 1 ? part1(input) : part2(input)
    end

    def part1(input)
      numbers, symbols = parse_input(input)

      numbers.each_with_index.sum do |line, index|
        line.sum do |number|
          adjacent?(number, *symbols[index - 1], *symbols[index], *symbols[index + 1]) ? number.value.to_i : 0
        end
      end
    end

    def part2(input)
      numbers, symbols = parse_input(input)

      symbols.each_with_index.sum do |line, index|
        line.sum do |symbol|
          next 0 unless symbol.value == '*'

          matches = [numbers[index - 1], numbers[index], numbers[index + 1]].flatten.filter do |number|
            (number.start - 1..number.end + 1).cover?(symbol.index)
          end

          matches.length == 2 ? matches[0].value.to_i * matches[1].value.to_i : 0
        end
      end
    end

    private

    Point = Struct.new(:value, :start, :end)
    Symbol = Struct.new(:value, :index)

    # 467..114..
    # ...*......
    # ..35..633.
    def parse_input(input)
      numbers = []
      symbols = []

      input.lines(chomp: true).each do |line|
        current_numbers = []
        current_symbols = []
        number = Point.new('', nil, nil)

        line.chars.each_with_index do |char, index|
          if char.match?(/\d/)
            number.value += char
            number.start ||= index
            number.end = index
            next
          end

          current_symbols << Symbol.new(char, index) if char != '.'

          if number.value != ''
            current_numbers << number
            number = Point.new('', nil, nil)
          end
        end

        current_numbers << number if number.value != ''
        numbers << current_numbers
        symbols << current_symbols
      end

      [numbers, symbols]
    end

    def adjacent?(point, *symbols)
      symbols.any? { |symbol| (point.start - 1..point.end + 1).cover?(symbol.index) }
    end
  end
end
