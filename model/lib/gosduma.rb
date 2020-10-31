require "dry-auto_inject"
require "dry-container"
require "dry-initializer"

require "gosduma/version"
require "gosduma/types"

module Gosduma
  class Error < StandardError; end

  class Container
    extend Dry::Container::Mixin

    register("repositories.votes") { External::Votes.new }

    register("gateways.http") do
      require_relative "gosduma/external/http"
      External::HTTP.new
    end

    register("gateways.json") do
      require_relative "gosduma/external/json_http"
      External::JSONHTTP.new
    end

    register("gateways.duma") do
      require "gosduma/external/duma"
      External::Duma.new
    end
  end

  Import = Dry::AutoInject(Container)
end
