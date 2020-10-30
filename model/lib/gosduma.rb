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
    register("gateways.http") { External::HTTP.new }
    register("gateways.duma") do
      require "gosduma/external/duma"
      External::Duma.new
    end
  end

  Import = Dry::AutoInject(Container)
end
