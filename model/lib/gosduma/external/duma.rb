require_relative "duma_request"

module Gosduma
  module External
    class Duma
      def get(method, params = {})
        DumaRequest.new(method, params: params).call
      end
    end
  end
end
