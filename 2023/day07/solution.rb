module Aoc2023
  class Day07
    def solve(part)
      file = File.join(__dir__, 'input.txt')
      input = File.read(file)
      raise 'Empty input.txt file' if input.empty?

      part == 1 ? part1(input) : part2(input)
    end

    def part1(input)
      parse_input(input).sort(&sorter(with_jokers: false)).map.with_index(1) { |hand, i| hand.bid * i }.sum
    end

    def part2(input)
      parse_input(input).sort(&sorter(with_jokers: true)).map.with_index(1) { |hand, i| hand.bid * i }.sum
    end

    private

    RANKS = %w[2 3 4 5 6 7 8 9 T J Q K A].map.with_index { |r, i| [r, i + 2] }.to_h.freeze
    RANKS_WITH_JOKERS = %w[J 2 3 4 5 6 7 8 9 T Q K A].map.with_index { |r, i| [r, i + 2] }.to_h.freeze

    # 32T3K 765
    # T55J5 684
    # KK677 28
    # KTJJT 220
    # QQQJA 483
    def parse_input(input)
      input.lines(chomp: true).map { |line| Hand.new(line) }
    end

    def sorter(with_jokers:)
      ranks = with_jokers ? RANKS_WITH_JOKERS : RANKS

      lambda { |a, b|
        comparison = a.score(with_jokers:) <=> b.score(with_jokers:)

        if comparison.zero?
          first_different_card = a.cards.zip(b.cards).find { |card_a, card_b| card_a != card_b }
          ranks[first_different_card.first] <=> ranks[first_different_card.last]
        else
          comparison
        end
      }
    end

    class Hand
      attr_reader :cards, :bid

      def initialize(line)
        cards, bid = line.split
        @cards = cards.chars
        @bid = bid.to_i
      end

      def score(with_jokers:)
        @score ||= with_jokers ? calculate_score_with_jokers : calculate_score
      end

      private

      def calculate_score
        @cards.tally.sum { |_, count| count * count }
      end

      def calculate_score_with_jokers
        return 25 if @cards.all? { |card| card == 'J' }

        first, *rest = @cards.reject { |c| c == 'J' }.tally.sort_by { |_, count| -count }
        first[1] += @cards.count('J')

        [first, *rest].sum { |(_, count)| count * count }
      end
    end
  end
end
