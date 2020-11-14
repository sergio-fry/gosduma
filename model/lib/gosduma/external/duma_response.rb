module Gosduma
  module External
    class DumaResponse
      extend Dry::Initializer
      param :method
      option :params

      include Import["json"]
      include Import["config"]

      def call
        json.get uri.to_s
      end

      private

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
