require "rack/test"
require "json"

require "gosduma/web/app"

RSpec.describe "GET /api/list" do
  include Rack::Test::Methods
  def app
    Gosduma::Web::App.freeze.app
  end

  before { get "/api/list" }

  it { expect(last_response).to be_ok }

  describe "response" do
    subject { JSON.parse(last_response.body) }

    it { is_expected.to be_a Array }
  end
end
