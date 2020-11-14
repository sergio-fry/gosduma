require "json"

require "gosduma/member"
require "gosduma/members"

module Gosduma
  RSpec.describe Members do
    let(:members) { Members.new limit: 10 }

    before { Container.stub("json", json) }
    let(:json) { double(:json, get: data) }
    let(:data) do
      [
        {
          id: "99100491",
          name: "Абдулатипов Рамазан Гаджимурадович",
          position: "Член СФ",
          isCurrent: false
        }
      ]
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
