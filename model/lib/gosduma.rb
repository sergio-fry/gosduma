require "gosduma/version"
require "dry-container"
require "dry-auto_inject"

module Gosduma
  class Error < StandardError; end

  class Container
    extend Dry::Container::Mixin

    register "repositories.votes"
  end

  Import = Dry::AutoInject(Container)
end
