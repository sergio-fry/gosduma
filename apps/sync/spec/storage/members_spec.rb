require "gosduma/sync/storage/members"

module Gosduma
  module Sync
    module Storage
      RSpec.describe Members do
        let(:repo) { Members.new }
        let(:member_ivan) { double(:member, id: 1, name: "Ivan", position: "deputy", presence: 0.7) }

        before { repo << member_ivan }

        describe "stored member" do
          subject(:member) { repo.first }
          it { expect(member.id).to eq 1 }
          it { expect(member.name).to eq "Ivan" }
          it { expect(member.position).to eq "deputy" }
          it { expect(member.presence).to eq 0.7 }
        end
      end
    end
  end
end
