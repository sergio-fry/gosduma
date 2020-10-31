module Gosduma
  class MemberPresence
    extend Dry::Initializer
    param :member
    param :interval

    include Import["gateways.duma"]

    def call
      return 1 if total_votings == 0

      (total_votings - absents_count).to_f / total_votings
    end

    def total_votings
      duma.vote_stats.values.sum
    end

    def absents_count
      duma.vote_stats[:absentCount]
    end
  end
end
