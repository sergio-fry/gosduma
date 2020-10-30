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

      (@votes.size - @votes.select { |v| v.absent? }.count.to_f) / @votes.size
    end
  end
end
