require "gosduma/member_votes"

module Gosduma
  class Member
    attr_reader :id

    def initialize(id:)
      @id = id
      @votes = MemberVotes.new(self)
    end

    def attendance
      # return 1 if @votes.size == 0

      (total_votes - absents_count.to_f) / total_votes
    end

    def absents_count
      @votes.select { |v| v.absent? }.count
    end

    def total_votes
      @votes.size
    end
  end
end
