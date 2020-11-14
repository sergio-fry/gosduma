require "dry-auto_inject"
require "dry-initializer"
require "dry-configurable"

require "dotenv"
Dotenv.load(".env.local", ".env")

require "gosduma/version"
require "gosduma/types"

module Gosduma
  class Error < StandardError; end

  class Config
    extend Dry::Configurable

    setting :duma do
      setting :token, ENV.fetch("DUMA_API_TOKEN")
      setting :app_token, ENV.fetch("DUMA_API_APP_TOKEN")
    end

    setting :json, nil
  end

  class Container
    extend Dry::Container::Mixin

    register("http", memoize: true) do
      require "faraday"
      require "faraday_middleware"

      Faraday.new do |builder|
        builder.adapter Faraday.default_adapter
      end
    end

    register("json") do
      if resolve("config").json.nil?
        require_relative "gosduma/external/http/json"
        External::HTTP::JSON.new
      else
        resolve("config").json
      end
    end

    register("config") { Config.config }
  end

  Import = Dry::AutoInject(Container)
end
