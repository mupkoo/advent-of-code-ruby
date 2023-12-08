def main(part)
  file = File.join(__dir__, 'input.txt')
  input = File.read(file)
  raise 'Empty input.txt file' if input.empty?

  part == 1 ? part1(input) : part2(input)
end

def part1(input)
  parse_input(input).sum do |line|
    first_digit = line[/\d/]
    last_digit = line[/\d(?=[^\d]*\z)/]

    (first_digit.to_s + last_digit.to_s).to_i
  end
end

DIGIT_MAP =
  %w[zero one two three four five six seven eight nine]
  .each_with_index.map do |word, number|
    [[word, number.to_s],
     [number.to_s, number.to_s]]
  end.flatten(1).to_h.freeze

def part2(input)
  parse_input(input).sum do |line|
    first = '', Float::INFINITY
    last = '', -1

    DIGIT_MAP.each do |word, digit|
      start_index = line.index(word)
      end_index = line.rindex(word)

      first = [digit, start_index] if !start_index.nil? && start_index < first[1]
      last = [digit, end_index] if !end_index.nil? && end_index > last[1]
    end

    (first[0] + last[0]).to_i
  end
end

def parse_input(input)
  input.lines(chomp: true)
end
