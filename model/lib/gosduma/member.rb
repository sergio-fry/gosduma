require "gosduma/member_votes"

module Gosduma
  class Member
    def initialize(id:, votes: MemberVotes.new(id))
      @id = id
      @votes = votes
    end

    def attendance(from, to)
      1
    end
  end
end
