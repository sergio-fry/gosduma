require "faraday"

module Gosduma
  module External
    module HTTP
      class HTTP
        class Response
          extend Dry::Initializer

          option :status, type: Types::Coercible::Integer
          option :body, type: Types::Coercible::String
          option :headers, type: Types::Coercible::Hash
        end

        def get(url)
          resp = Faraday.get url

          Response.new(
            status: resp.status,
            body: resp.body,
            headers: resp.headers
          )
        end
      end
    end
  end
end
