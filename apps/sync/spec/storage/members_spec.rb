require "gosduma/sync/storage/members"

module Gosduma
  module Sync
    module Storage
      RSpec.describe Members do
        let(:repo) { Members.new }
        let(:member_ivan) { build_member(name: "Ivan") }

        before { repo << member_ivan }

        describe "stored member" do
          subject(:member) { repo.first }
          it { expect(member.id).to eq 1 }
          it { expect(member.name).to eq "Ivan" }
          it { expect(member.position).to eq "deputy" }
          it { expect(member.presence).to eq 0.7 }
        end

        let(:default_attrs) do
          {id: 1, name: "Name", position: "deputy", presence: 0.7}
        end

        def build_member(attrs)
          double(:member, default_attrs.merge(attrs))
        end
      end
    end
  end
end
