module Gosduma
  class MemberVotes
    include Import["repositories.votes"]
    include Enumerable

    def initialize(member, *args)
      super(*args)

      @member = member
    end

    def size
      1
    end

    def each
      votes.member_votes(@member.id).each do |vote|
        yield vote
      end
    end
  end
end
