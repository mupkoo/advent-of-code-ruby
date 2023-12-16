module Aoc2023
  class Day10
    Point = Struct.new(:row, :col)

    def solve(part)
      file = File.join(__dir__, 'input.txt')
      input = File.read(file)
      raise 'Empty input.txt file' if input.empty?

      part == 1 ? part1(input) : part2(input)
    end

    def part1(input)
      lines = parse_input(input)
      start_point = find_start_point(lines)
      start_symbol = find_start_symbol(lines, start_point)
      chain = find_chain(lines, start_point, start_symbol)

      chain.size / 2
    end

    def part2(input)
      lines = parse_input(input)
      start_point = find_start_point(lines)
      start_symbol = find_start_symbol(lines, start_point)
      chain = find_chain(lines, start_point, start_symbol).to_h { |point| [point, true] }
      lines[start_point.row][start_point.col] = start_symbol

      lines.each_with_index.sum do |line, row|
        inside = false
        riding = ''
        count = 0

        line.chars.each_with_index do |char, col|
          part_of_chain = chain[Point.new(row, col)]

          count += 1 if !part_of_chain && inside

          next unless part_of_chain

          if char == '|' || (riding == 'F' && char == 'J') || (riding == 'L' && char == '7')
            inside = !inside
          elsif 'FL'.include?(char)
            riding = char
          end
        end

        count
      end
    end

    private

    # ..F7.
    # .FJ|.
    # SJ.L7
    # |F--J
    # LJ...
    def parse_input(input)
      input.lines(chomp: true)
    end

    def find_start_point(lines)
      lines.each_with_index do |line, row|
        col = line.index('S')
        return Point.new(row, col) if col
      end
    end

    def find_start_symbol(lines, point)
      possible = %w[- | L J 7 F]

      possible &= %w[- J 7] if '-FL'.include?(lines[point.row][point.col - 1])
      possible &= %w[- L F] if '-J7'.include?(lines[point.row][point.col + 1])
      possible &= %w[| L J] if '|F7'.include?(lines[point.row - 1][point.col])
      possible &= %w[| F 7] if '|LJ'.include?(lines[point.row + 1][point.col])

      raise "multiple possibles for point - #{possible.join(', ')}" unless possible.one?

      possible.first
    end

    def find_next_point(chain, lines)
      current = chain.last
      previous = chain[-2]

      case lines[current.row][current.col]
      when '-'
        previous.col < current.col ? Point.new(current.row, current.col + 1) : Point.new(current.row, current.col - 1)
      when '|'
        previous.row < current.row ? Point.new(current.row + 1, current.col) : Point.new(current.row - 1, current.col)
      when 'L'
        previous.row < current.row ? Point.new(current.row, current.col + 1) : Point.new(current.row - 1, current.col)
      when 'J'
        previous.row < current.row ? Point.new(current.row, current.col - 1) : Point.new(current.row - 1, current.col)
      when '7'
        previous.row > current.row ? Point.new(current.row, current.col - 1) : Point.new(current.row + 1, current.col)
      when 'F'
        previous.row > current.row ? Point.new(current.row, current.col + 1) : Point.new(current.row + 1, current.col)
      end
    end

    def find_chain(lines, start_point, start_symbol)
      chain = [
        start_point,
        case start_symbol
        when '-', 'L', 'F'
          Point.new(start_point.row, start_point.col + 1)
        when '|', 'J'
          Point.new(start_point.row - 1, start_point.col)
        when '7'
          Point.new(start_point.row + 1, start_point.col)
        end
      ]

      chain << find_next_point(chain, lines) until lines[chain.last.row][chain.last.col] == 'S'

      chain
    end
  end
end
