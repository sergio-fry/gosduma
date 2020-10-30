
module Gosduma
  module External
    class HTTP
      class Response
        extend Dry::Initializer

        option :status, type: Types::Coercible::Integer
        option :body, type: Types::Coercible::String
        option :headers, type: Types::Coercible::Hash
      end
    end
  end
end

