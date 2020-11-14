module Gosduma
  module Web
    class Cache
      extend Dry::Initializer
      param :redis

      def fetch(key)
        if exists? key
          read key
        else
          val = yield

          write key, val

          val
        end
      end

      def exists?(key)
        redis.exists? key
      end

      def read(key)
        Marshal.load redis.get(key)
      end

      def write(key, val)
        redis.set key, Marshal.dump(val)
      end
    end
  end
end
