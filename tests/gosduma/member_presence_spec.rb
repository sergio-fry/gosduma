require "gosduma_helper"

require "json"
require "gosduma/member"
require "gosduma/member_presence"

module Gosduma
  RSpec.describe MemberPresence do
    subject { described_class.new(member, nil, vote_stats: vote_stats).value }
    let(:member) { Member.new 1 }
    let(:vote_stats) { double(:vote_stats) }

    context do
      let(:vote_stats) { double(:vote_stats, absent_count: 0, total: 1) }

      it { is_expected.to eq 1 }
    end

    context do
      let(:vote_stats) { double(:vote_stats, absent_count: 1, total: 2) }

      it { is_expected.to eq 0.5 }
    end

    context do
      let(:vote_stats) { double(:vote_stats, absent_count: 0, total: 0) }

      it { is_expected.to eq 1 }
    end
  end
end
