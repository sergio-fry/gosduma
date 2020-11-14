require_relative "external/duma"
require_relative "vote_stats"

module Gosduma
  class MemberPresence
    extend Dry::Initializer
    param :member
    param :interval

    def value
      return 1 if total_votings == 0

      (total_votings - absents_count).to_f / total_votings
    end

    def total_votings
      vote_stats.total
    end

    def absents_count
      vote_stats.absent_count
    end

    def vote_stats
      @vote_stats ||= VoteStats.new(member.id)
    end
  end
end
