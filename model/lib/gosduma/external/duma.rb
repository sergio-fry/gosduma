require "gosduma/external/json_http"

module Gosduma
  module External
    class Duma
      def initialize
        @http = JSONHTTP.new
      end

      def vote_stats(deputy)
        resp = @http.get "http://api.duma.gov.ru/api/:token/voteStats.xml?deputy=99111015"

        {
          absentCount: resp[:absentCount].to_i,
          abstainCount: resp[:abstainCount].to_i,
          againstCount: resp[:againstCount].to_i,
          forCount: resp[:forCount].to_i
        }
      end
    end
  end
end
