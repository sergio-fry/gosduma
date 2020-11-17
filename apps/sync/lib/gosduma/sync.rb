require "dotenv"
Dotenv.load(".env.services", ".env.local", ".env")

require "gosduma"

$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), "..")))

module Gosduma
  module Sync
    class Config
      extend Dry::Configurable

      setting :redis_url, ENV.fetch("REDIS_URL")
    end

    class Container
      extend Dry::Container::Mixin

      register "redis", memoize: true do
        require "redis"

        Redis.new(url: Config.config.redis_url)
      end

      register("members") do
        require "gosduma/members"

        Members.new
      end

      register("storage") do
        require "gosduma/sync/storage/members"

        Storage::Members.new
      end

      register "cache", memoize: true do
        require "gosduma/sync/cache"

        Cache.new
      end

      register "logger", memoize: true do
        require "logger"

        Logger.new(STDOUT)
      end
    end

    Import = Dry::AutoInject(Container)

    require "gosduma/sync/cached_json"
    Gosduma::Config.config.json = CachedJSON.new ttl: (60 * 60 * 24)
  end
end
