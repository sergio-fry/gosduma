require "gosduma/external/json_http"

module Gosduma
  module External
    class Duma
      def initialize
        @http = JSONHTTP.new
      end

      def vote_stats(deputy)
        resp = @http.get "http://api.duma.gov.ru/api/:token/voteStats.xml?deputy=99111015"

        data = JSON.parse(resp.body, symbolize_names: true)
      end
    end
  end
end
