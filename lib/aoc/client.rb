require 'httparty'

module AOC
  class Client
    include HTTParty
    base_uri 'https://adventofcode.com'

    def initialize(session)
      @options = { headers: { 'Cookie' => "session=#{session}" }, follow_redirects: false }
    end

    def input(year, day)
      self.class.get("/#{year}/day/#{day}/input", @options)
    end
  end
end
