require "dry-container"
require "dry-auto_inject"
require 'dry/container/stub'

class TestContainer
  extend Dry::Container::Mixin

  register "repositories.votes" do
    nil
  end
end

TestContainer.enable_stubs!
Import = Dry::AutoInject(TestContainer)
