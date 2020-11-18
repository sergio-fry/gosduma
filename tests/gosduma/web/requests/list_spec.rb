require "gosduma/web_helper"

require "json"

module Gosduma
  module Web
    RSpec.describe "GET /api/members", type: :request do
      before { Container.stub("members", ->(_args) { members }) }
      let(:members) { [double(:member, id: 1, name: "Ivan", presence: 1.0)] }
      before { get "/api/members" }

      it { expect(last_response).to be_ok }

      describe "response" do
        subject { JSON.parse(last_response.body) }

        it { is_expected.to be_a Array }
      end
    end
  end
end
