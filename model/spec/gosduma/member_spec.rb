require 'date'
require "gosduma/member"

module Gosduma
  RSpec.describe Member do
    let(:member) { Member.new id: 1 }
    before { TestContainer.stub("repositories.votes", repo) }
    let(:repo) { double(:repo) }

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
    end
  end
end
