require "json"

require "gosduma/member"
require "gosduma/members"

require "gosduma/external/http/http"

module Gosduma
  RSpec.describe Members do
    let(:members) { Members.new limit: 10 }

    before { Container.stub("http", http) }
    let(:http) { double(:http, get: http_response) }
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

    it { expect(members.to_a.size).to eq 3 }
    it { expect(members.first).to be_a Member }
  end
end
