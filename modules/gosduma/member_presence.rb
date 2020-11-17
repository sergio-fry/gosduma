require_relative "vote_stats"

module Gosduma
  class MemberPresence
    extend Dry::Initializer
    param :member
    param :interval
    option :vote_stats, default: -> { VoteStats.new(member.id) }

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
  end
end
