require "gosduma/external/duma"

module Gosduma
  module External
    RSpec.describe Duma do
      describe "#vote_stats" do
        let(:response) do
          {
            "registrationCount": 130,
            "registeredCount": 127,
            "forCount": "2869",
            "againstCount": "46",
            "abstainCount": "3",
            "absentCount": "3002"
          }
        end
      end
    end
  end
end
