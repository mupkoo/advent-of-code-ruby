# Advent of Code Challenge Solver

Welcome to the Advent of Code Go project! This repository contains the solutions for the Advent of Code (AoC) - an annual set of Christmas-themed programming challenges.

## Getting Started

Before you can start using this project, make sure you have Ruby installed on your system as this project assumes a Ruby development environment.

### Prerequisites

- Ruby (the version will be specified in the `.tool-versions` file)
- Bundler (`gem install bundler` if you don't have Bundler already installed)
- `AOC_SESSION_COOKIE` environment variable set to your Advent of Code session cookie

### Setup

1. Clone this repository to your local development environment:
   ```bash
   git clone https://github.com/mupkoo/advent-of-code-ruby.git
   ```
2. Change into the project's directory:
   ```bash
   cd advent-of-code-ruby
   ```
3. Install the required Ruby gems:
   ```bash
   bundle install
   ```

## Usage

The project includes a custom command-line tool `aoc` for streamlined operations:

### Generate Challenge Skeleton

To create a new skeleton file for the day's challenge:
```bash
aoc generate --year=2023 --day=1
```

You can generate only the input for that day by running:
```bash
aoc generate input --year=2023 --day=1
``` 

### Run Solution

Execute your solution for the day's challenge:
```bash
aoc run --year=2023 --day=1
```

You can omit the `--year` and `--day` options if you want to run the solution for the current year and day.
```bash
aoc run
```

### Display Help

You can always run the following command to get more help and options available in the `aoc` CLI tool:
```bash
aoc help
```

### Continuous Testing with `guard`

This project uses `guard` to automatically run tests when files change. To take advantage of this feature, run:

```bash
bundle exec guard
```

The test suite will be triggered automatically upon saving changes to your solution or test files.
