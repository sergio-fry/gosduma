module Gosduma
  module Web
    class Cache
      extend Dry::Initializer
      param :redis

      def fetch(key, ttl:)
        if redis.exists? key
          redis.get key
        else
          val = yield

          redis.set key, val, ex: ttl

          val
        end
      end
    end
  end
end
