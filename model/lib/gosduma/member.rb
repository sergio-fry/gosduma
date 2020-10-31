require_relative "member_presence"

module Gosduma
  class Member
    extend Dry::Initializer
    param :id

    def presence
      MemberPresence.new(self, nil).call
    end
  end
end
