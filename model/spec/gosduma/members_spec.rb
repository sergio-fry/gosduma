require "gosduma/member"
require "gosduma/members"

module Gosduma
  RSpec.describe Members do
    let(:members) { Members.new limit: 10 }

    it { expect(members.to_a.size).to eq 10 }
    it { expect(members.first).to be_a Member }
  end
end
