require "gosduma/external/duma"
require "gosduma/external/http"

module Gosduma
  module External
    RSpec.describe Duma do
      let(:duma) { Duma.new }
      before { Container.stub("gateways.http", http) }

      describe "#vote_stats" do
        subject { duma.vote_stats(1) }

        let(:http) { double(:http, get: response) }

        let(:response) do
          HTTP::Response.new(
            status: 200,
            headers: {},
            body: {
              registrationCount: 1,
              registeredCount: 2,
              forCount: "3",
              againstCount: "4",
              abstainCount: "5",
              absentCount: "6"
            }.to_json
          )
        end

        it { is_expected.to include(forCount: 3) }
        it { is_expected.to include(againstCount: "4") }
        it { is_expected.to include(abstainCount: "5") }
        it { is_expected.to include(absentCount: "6") }
      end
    end
  end
end
