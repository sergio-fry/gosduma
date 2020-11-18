require "gosduma/duma_response"

module Gosduma
  class VoteStats
    extend Dry::Initializer
    param :member_id

    def total
      absent_count + abstain_count + against_count + for_count
    end

    def absent_count
      response[:absentCount].to_i
    end

    def abstain_count
      response[:abstainCount].to_i
    end

    def against_count
      response[:againstCount].to_i
    end

    def for_count
      response[:forCount].to_i
    end

    private

    def response
      @response ||= DumaResponse.new("voteStats", params: {deputy: member_id}).call
    end
  end
end
