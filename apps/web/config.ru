require_relative "lib/gosduma/web"
require "gosduma/web/app"

require "rack"
require "rack/cache"
require "redis-rack-cache"

use Rack::Cache,
  metastore: "#{ENV.fetch("REDIS_URL")}/metastore",
  entitystore: "#{ENV.fetch("REDIS_URL")}/entitystore"

run Gosduma::Web::App.freeze.app
