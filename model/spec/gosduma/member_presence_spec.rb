require "json"
require "gosduma/member"
require "gosduma/member_presence"
require "gosduma/external/http/http"

module Gosduma
  RSpec.describe MemberPresence do
    subject { described_class.new(member, nil).value }
    let(:member) { Member.new 1 }

    context "when json stubbed" do
      before { Container.stub("json", json) }
      let(:json) { double(:json, get: response) }

      context do
        let(:response) do
          {
            absentCount: 0,
            abstainCount: 1,
            againstCount: 1,
            forCount: 1
          }
        end

        it { is_expected.to eq 1 }
      end

      context do
        let(:response) do
          {
            absentCount: 1,
            abstainCount: 1,
            againstCount: 0,
            forCount: 0
          }
        end

        it { is_expected.to eq 0.5 }
      end

      context do
        let(:response) do
          {
            absentCount: 0,
            abstainCount: 0,
            againstCount: 0,
            forCount: 0
          }
        end

        it { is_expected.to eq 1 }
      end
    end
  end
end
