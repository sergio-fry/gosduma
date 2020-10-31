require "date"
require "gosduma/member"
require "gosduma/vote"

module Gosduma
  RSpec.describe Member do
    let(:member) { Member.new id: 1 }
    let(:duma) { double(:duma, vote_stats: vote_stats) }
    before { Container.stub("gateways.json", duma) }

    describe "#presence" do
      subject { member.presence }

      context do
        let(:vote_stats) do
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
        let(:vote_stats) do
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
        let(:vote_stats) do
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
