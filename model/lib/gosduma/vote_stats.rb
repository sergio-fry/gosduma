require "gosduma/external/duma_response"

module Gosduma
  class VoteStats
    extend Dry::Initializer
    param :deputy_id

    def each
      resp = DumaResponse.new("voteStats", deputy: deputy).call

      {
        absent_count: resp[:absentCount].to_i,
        abstain_count: resp[:abstainCount].to_i,
        against_couunt: resp[:againstCount].to_i,
        for_count: resp[:forCount].to_i,
        registration_count: resp[:registrationCount].to_i,
        registered_count: resp[:registeredCount].to_i
      }
    end
  end
end
