require "dotenv"
Dotenv.load(".env.services", ".env.local", ".env")

require "gosduma"

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
    end

    Import = Dry::AutoInject(Container)
  end
end
