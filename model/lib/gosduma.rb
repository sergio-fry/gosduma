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
  end

  class Container
    extend Dry::Container::Mixin

    register("http") do
      require_relative "gosduma/external/http/http"
      External::HTTP::HTTP.new
    end

    register("json") do
      require_relative "gosduma/external/http/json"
      External::HTTP::JSON.new
    end

    register "config" do
      Config.config
    end
  end

  Import = Dry::AutoInject(Container)
end
