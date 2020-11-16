require "gosduma/sync/storage/members"

module Gosduma
  module Sync
    module Storage
      RSpec.describe Members do
        let(:repo) { Members.new }
        let(:member_ivan) { double(:member, id: 1, name: "Ivan") }

        before { repo << member_ivan }

        describe "stored member" do
          subject(:member) { repo.first }
          it { expect(member.id).to eq 1 }
          it { expect(member.name).to eq "Ivan" }
        end
      end
    end
  end
end
