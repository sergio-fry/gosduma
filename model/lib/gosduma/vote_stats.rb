require "gosduma/external/duma_response"

module Gosduma
  class VoteStats
    extend Dry::Initializer
    param :member_id

    def total
      absent_count + abstain_count + against_count + for_count +
        registration_count + registered_count
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

    def registration_count
      response[:registrationCount].to_i
    end

    def registered_count
      response[:registeredCount].to_i
    end

    private

    def response
      @response ||= External::DumaResponse.new("voteStats", deputy: member_id).call
    end
  end
end
