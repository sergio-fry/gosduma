require "gosduma_helper"

require "gosduma/external/http/json"

module Gosduma
  module External
    module HTTP
      RSpec.describe JSON do
        let(:json) { JSON.new }
        before { Container.stub("http", http) }
        let(:http) { double(:http, get: response) }

        context do
          let(:response) do
            double(:respoonse, status: 200, headers: {}, body: {foo: "bar"}.to_json)
          end

          it { expect(json.get("http://example.com/foo.json")).to eq({foo: "bar"}) }
        end
      end
    end
  end
end
