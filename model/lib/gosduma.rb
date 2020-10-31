require "dry-auto_inject"
require "dry-initializer"

require "gosduma/version"
require "gosduma/types"

module Gosduma
  class Error < StandardError; end

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
  end

  Import = Dry::AutoInject(Container)
end
