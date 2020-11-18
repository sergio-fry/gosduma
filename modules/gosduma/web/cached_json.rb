require "gosduma/http/json"

module Gosduma
  module Web
    class CachedJSON
      include Import["cache"]

      def get(url)
        cache.fetch url do
          json.get url
        end
      end

      def json
        External::HTTP::JSON.new
      end
    end
  end
end
