require "json"

module Gosduma
  module External
    module HTTP
      class JSON
        include Import["gateways.http"]

        class Response
          extend Dry::Initializer
          option :http_response

          def body
            JSON.parse(http_response.body, symbolize_names: true)
          end
        end

        def get(url)
          Response.new http.get(url)
        end
      end
    end
  end
end
