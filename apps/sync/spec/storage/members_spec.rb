require "gosduma/sync/storage/members"

module Gosduma
  module Sync
    module Storage
      RSpec.describe Members do
        let(:repo) { Members.new }

        context do
          before { add_member(id: 1, name: "Ivan") }

          describe "stored member" do
            subject { repo.find_by_id(1) }
            it { expect(repo.to_a.size).to eq 1 }
            it { expect(subject.id).to eq 1 }
            it { expect(subject.name).to eq "Ivan" }
            it { expect(subject.position).to eq "deputy" }
            it { expect(subject.presence).to eq 0.7 }
          end
        end

        context do
          before { add_member(id: 1, name: "Ivan") }
          before { add_member(id: 2, name: "Petr") }

          it { expect(repo.to_a.size).to eq 2 }

          context do
            before { repo.clear }
            it { expect(repo.to_a.size).to eq 0 }
          end
        end

        let(:default_attrs) do
          {id: 1, name: "Name", position: "deputy", presence: 0.7}
        end

        def add_member(attrs)
          repo << build_member(attrs)
        end

        def build_member(attrs)
          double(:member, default_attrs.merge(attrs))
        end

        after { repo.clear }
      end
    end
  end
end
