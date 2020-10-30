module Gosduma
  class Member
    extend Dry::Initializer
    param :id

    include Import["gateways.duma"]

    def attendance
      total = duma.vote_stats.values.sum

      return 1 if total == 0

      absent = duma.vote_stats[:absentCount]

      (total - absent).to_f / total
    end
  end
end
