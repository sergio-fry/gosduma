require 'date'
require "gosduma/member"

module Gosduma
  RSpec.describe Member do
    let(:member) { Member.new id: 1, votes: member_votes }
    let(:member_votes) { MemberVotes.new }

    describe "#attendance" do
      subject { member.attendance(from, to) }
      let(:from) { DateTime.parse('2020-01-01 00:00')  }
      let(:to) { DateTime.parse('2020-02-01 00:00')  }

      it { is_expected.to eq 1 }
    end
  end
end
