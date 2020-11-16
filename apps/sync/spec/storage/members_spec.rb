require "gosduma/member"
require "gosduma/sync/storage/members"

module Gosduma
  module Sync
    module Storage
      RSpec.describe Members do
        let(:repo) { Members.new }
        let(:member) { Member.new(1) }

        before { repo << member }

        it { expect(repo.to_a).to include member }
      end
    end
  end
end
