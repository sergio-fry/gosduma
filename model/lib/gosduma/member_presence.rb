require_relative "external/json_http"

module Gosduma
  class MemberPresence
    extend Dry::Initializer
    param :member
    param :interval

    include Import["gateways.json"]

    def call
      return 1 if total_votings == 0

      (total_votings - absents_count).to_f / total_votings
    end

    def total_votings
      vote_stats.values.sum
    end

    def absents_count
      vote_stats[:absentCount]
    end

    def vote_stats
      resp = json.get "http://api.duma.gov.ru/api/:token/voteStats.xml?deputy=99111015"

      {
        absentCount: resp[:absentCount].to_i,
        abstainCount: resp[:abstainCount].to_i,
        againstCount: resp[:againstCount].to_i,
        forCount: resp[:forCount].to_i
      }
    end
  end
end
