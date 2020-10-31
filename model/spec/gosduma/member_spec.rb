require "date"
require "gosduma/member"
require "gosduma/vote"

module Gosduma
  RSpec.describe Member do
    let(:member) { Member.new id: 1 }

    before { Container.stub("json", json) }
    let(:json) { double(:json, get: response) }

    context do
      let(:response) do
        {
          absentCount: 0,
          abstainCount: 0,
          againstCount: 0,
          forCount: 1
        }
      end

      it { expect(member.presence).to eq 1 }
    end
  end
end
