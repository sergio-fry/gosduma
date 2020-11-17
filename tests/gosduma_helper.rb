require_relative "../modules/gosduma"

require "dry/container/stub"

Gosduma::Container.enable_stubs!

RSpec.configure do |config|
  config.after do
    Gosduma::Container.unstub
  end
end
