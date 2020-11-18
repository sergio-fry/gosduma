module Gosduma
  class Cache
    include Import["redis", "logger"]

    def fetch(key, ttl: nil)
      if exists? key
        logger.debug "read #{key}, cached"
        read key
      else
        logger.debug "read #{key}, missed"
        val = yield

        write key, val, ttl: ttl

        val
      end
    end

    def exists?(key)
      redis.exists? key
    end

    def read(key)
      Marshal.load redis.get(key)
    end

    def write(key, val, ttl: nil)
      redis.set key, Marshal.dump(val), ex: ttl
    end
  end
end
