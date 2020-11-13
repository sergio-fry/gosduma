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

      describe "#deputies" do
        let(:response) { duma.deputies }
        let(:http_response) do
          External::HTTP::HTTP::Response.new(
            status: 200,
            headers: {},
            body: [{
              "id": "99100491",
              "name": "Абдулатипов Рамазан Гаджимурадович",
              "position": "Член СФ",
              "isCurrent": false
            }, {
              "id": "99100001",
              "name": "Абдулбасиров Магомедтагир Меджидович",
              "position": "Депутат ГД",
              "isCurrent": false
            }, {
              "id": "99100002",
              "name": "Абельцев Сергей Николаевич",
              "position": "Депутат ГД",
              "isCurrent": true
            }].to_json
          )
        end

        it { expect(response.size).to eq 3 }
        describe "first deputy" do
          subject { response[0] }
          it { is_expected.to include(id: "99100491") }
          it { is_expected.to include(name: "Абдулатипов Рамазан Гаджимурадович") }
          it { is_expected.to include(position: "Член СФ") }
          it { is_expected.to include(is_current: false) }
        end
      end
    end
  end
end
