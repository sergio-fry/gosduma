module Gosduma
  module External
    class Duma
      include Import["json"]

      def get(method, params = {})
        json.get "http://api.duma.gov.ru/api/:token/voteStats.xml?deputy=99111015"
      end
    end
  end
end
