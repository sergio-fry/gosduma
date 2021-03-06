require "dry-auto_inject"
require "dry-initializer"
require "dry-configurable"

$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__))))

require "gosduma/types"

module Gosduma
  class Error < StandardError; end

  class Config
    extend Dry::Configurable

    setting :duma do
      setting :token, ENV.fetch("DUMA_API_TOKEN")
      setting :app_token, ENV.fetch("DUMA_API_APP_TOKEN")
    end

    setting :redis_url, ENV.fetch("REDIS_URL")
  end

  class Container
    extend Dry::Container::Mixin

    register(:http, memoize: true) do
      require "faraday"
      require "faraday_middleware"

      Faraday.new do |builder|
        builder.adapter Faraday.default_adapter
      end
    end

    register(:json) do
      require_relative "gosduma/http/cached_json"
      HTTP::CachedJSON.new ttl: (60 * 60 * 24)
    end

    register(:config) { Config.config }

    register :redis, memoize: true do
      require "redis"

      Redis.new(url: Config.config.redis_url)
    end

    register(:members) do
      require "gosduma/members"

      Members.new
    end

    namespace :storage do
      register :members do
        require "gosduma/storage/members"

        Sync::Storage::Members.new
      end
    end

    register :cache, memoize: true do
      require "gosduma/cache"

      Cache.new
    end

    register :logger, memoize: true do
      require "logger"

      Logger.new($stdout)
    end
  end

  Import = Dry::AutoInject(Container)
end
