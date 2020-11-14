require_relative "lib/gosduma/web"
require "gosduma/web/app"

run Gosduma::Web::App.freeze.app
