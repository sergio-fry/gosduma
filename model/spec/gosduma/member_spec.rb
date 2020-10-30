require "date"
require "gosduma/member"
require "gosduma/vote"

module Gosduma
  RSpec.describe Member do
    let(:member) { Member.new id: 1 }
    before { Container.stub("repositories.votes", repo) }
    let(:repo) { double(:repo, member_votes: votes) }

    describe "#attendance" do
      subject { member.attendance }

      context do
        let(:votes) { [Vote.new("for")] }
        it { is_expected.to eq 1 }
      end

      context do
        let(:votes) { [Vote.new("for"), Vote.new("absent")] }
        it { is_expected.to eq 0.5 }
      end

      context do
        let(:votes) { [] }
        it { is_expected.to eq 1 }
      end
    end
  end
end
