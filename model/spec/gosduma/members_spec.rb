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
        }].to_json
      )
    end

    it { expect(members.to_a.size).to eq 1 }

    describe "member" do
      subject(:member) { members.first }
      it { is_expected.to be_a Member }

      it { expect(member.id).to eq "99100491" }
      it { expect(member.name).to eq "Абдулатипов Рамазан Гаджимурадович" }
      it { expect(member.position).to eq "Член СФ" }
    end
  end
end
