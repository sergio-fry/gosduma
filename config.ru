#!/usr/bin/env ruby

require_relative "modules/gosduma"

require "gosduma/web/app"

require "rack/cache"
require "redis-rack-cache"

use Rack::Cache,
  metastore: "#{ENV.fetch("REDIS_URL")}/metastore",
  entitystore: "#{ENV.fetch("REDIS_URL")}/entitystore"

run Gosduma::Web::App.freeze.app
