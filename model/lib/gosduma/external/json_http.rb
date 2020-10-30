require "json"

module Gosduma
  module External
    class JSONHTTP
      include Import["gateways.http"]

      def get(url, params: {})
        JSON.parse(http.get(url).body, symbolize_names: true)
      end
    end
  end
end
