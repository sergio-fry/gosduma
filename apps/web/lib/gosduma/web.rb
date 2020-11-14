require "dry-auto_inject"
require "dry-initializer"
require "dry-configurable"

$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), "..")))

require "dotenv"
Dotenv.load(".env.services", ".env.local", ".env")

require "gosduma"

module Gosduma
  module Web
    class Config
      extend Dry::Configurable

      setting :redis_url, ENV.fetch("REDIS_URL")
    end

    class Container
      extend Dry::Container::Mixin

      register("members") do
        require "gosduma/members"
        ->(*args) { Members.new(*args) }
      end
      register("vote_stats") do
        require "gosduma/vote_stats"
        ->(*args) { VoteStats.new(*args) }
      end

      register "cache", memoize: true do
        require "gosduma/web/cache"
        require "redis"
        Cache.new Redis.new(url: Config.config.redis_url)
      end
    end

    Import = Dry::AutoInject(Container)

    require "gosduma/web/cached_json"
    Gosduma::Config.config.json = CachedJSON.new
  end
end
