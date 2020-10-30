require "json"

module Gosduma
  module External
    class JSONHTTP
      include Import["gateways.http"]

      def get(url, params: {})
        resp = http.get url

        JSON.parse(resp.body, symbolize_names: true)
      end
    end
  end
end
