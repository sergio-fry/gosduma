module Gosduma
  class Member
    extend Dry::Initializer
    param :id

    include Import["gateways.duma"]

    def attendance
      return 1 if total_votes == 0

      absent = duma.vote_stats[:absentCount]

      (total_votes - absent).to_f / total_votes
    end

    def total_votes
      duma.vote_stats.values.sum
    end
  end
end
