require "json"

module Gosduma
  module HTTP
    class JSON
      include Import["http"]

      def get(url)
        ::JSON.parse(http.get(url).body, symbolize_names: true)
      end
    end
  end
end
