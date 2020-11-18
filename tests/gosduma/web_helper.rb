require "gosduma_helper"

require "rack/test"
require "gosduma/web/app"

module Gosduma
  module Web
    module Test
      include Rack::Test::Methods

      def app
        Gosduma::Web::App.freeze.app
      end
    end
  end
end

require "warning"

Gem.loaded_specs["roda"].full_require_paths.each do |path|
  Warning.ignore(:missing_ivar, path)
end

RSpec.configure do |config|
  config.include Gosduma::Web::Test, type: :request
end
