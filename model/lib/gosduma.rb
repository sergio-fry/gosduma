require "dry-auto_inject"
require "dry-container"
require "dry-initializer"

require "gosduma/version"
require "gosduma/types"


module Gosduma
  class Error < StandardError; end

  class Container
    extend Dry::Container::Mixin

    register "repositories.votes" do
      External::Votes.new
    end

    register "gateways.http" do
      External::HTTP.new
    end
  end

  Import = Dry::AutoInject(Container)
end
