require_relative "json"

module Gosduma
  module HTTP
    class CachedJSON
      extend Dry::Initializer
      option :ttl, default: -> { 60 }
      include Import["cache"]

      def get(url)
        cache.fetch url, ttl: ttl do
          json.get url
        end
      end

      def json
        External::HTTP::JSON.new
      end
    end
  end
end
