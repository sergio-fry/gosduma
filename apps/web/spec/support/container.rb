require "dry/container/stub"

Gosduma::Web::Container.enable_stubs!

RSpec.configure do |config|
  config.after do
    Gosduma::Web::Container.unstub
  end
end
