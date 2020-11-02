module Gosduma
  module External
    class DumaRequest
      extend Dry::Initializer
      include Import["json"]
      include Import["config"]

      param :method
      param :params

      def call
        json.get uri.to_s
      end

      def uri
        URI::HTTP.build(
          host: "api.duma.gov.ru",
          path: "/api/#{config.duma.token}/#{method}.json",
          query: URI.encode_www_form({app_token: config.duma.app_token}.merge(params))
        )
      end
    end
  end
end
