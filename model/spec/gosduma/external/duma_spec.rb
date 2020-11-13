require "json"

require "gosduma/external/duma"
require "gosduma/external/http/http"

module Gosduma
  module External
    RSpec.describe Duma do
      let(:duma) { Duma.new }
      before { Container.stub("http", http) }
      let(:http) { double(:http, get: http_response) }

      describe "#vote_stats" do
        let(:response) { duma.vote_stats(1) }
        let(:http_response) do
          External::HTTP::HTTP::Response.new(
            status: 200,
            headers: {},
            body: {
              absentCount: "1",
              abstainCount: "2",
              againstCount: "3",
              forCount: "4",
              registeredCount: 5,
              registrationCount: 6
            }.to_json
          )
        end

        it { expect(response).to include(absent_count: 1) }
        it { expect(response).to include(abstain_count: 2) }
        it { expect(response).to include(against_couunt: 3) }
        it { expect(response).to include(for_count: 4) }
        it { expect(response).to include(registered_count: 5) }
        it { expect(response).to include(registration_count: 6) }
      end
    end
  end
end
