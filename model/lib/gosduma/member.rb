require "gosduma/member_votes"

module Gosduma
  class Member
    attr_reader :id

    def initialize(id:)
      @id = id
      @votes = MemberVotes.new(self)
    end

    def attendance
      @votes.size.to_f / @votes.select { |v| v.absent? }.count
    end
  end
end
