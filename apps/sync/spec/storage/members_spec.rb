require "gosduma/sync/storage/members"

module Gosduma
  module Sync
    module Storage
      RSpec.describe Members do
        let(:repo) { Members.new }
        let(:member_origin) { double(:member, id: 1) }

        before { repo << member_origin }

        describe "stored member" do
          subject(:member) { repo.first }
          it { expect(member.id).to eq 1 }
        end
      end
    end
  end
end
