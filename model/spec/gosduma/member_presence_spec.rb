module Gosduma
  RSpec.describe MemberPresence do
    let(:member) { Member.new id: 1 }
    before { Container.stub("gateways.http", http) }

    let(:http) { double(:http, get: response) }

    let(:response) do
      HTTP::Response.new(
        status: 200,
        headers: {},
        body: {
          registrationCount: 1,
          registeredCount: 2,
          forCount: "3",
          againstCount: "4",
          abstainCount: "5",
          absentCount: "6"
        }.to_json
      )
    end
  end
end
