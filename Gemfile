# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem "rake", "~> 12.0"
gem "dotenv"

gem "dry-auto_inject", "~> 0.7.0"
gem "dry-initializer", "~> 3.0.4"
gem "dry-types", "~> 1.4.0"
gem "falcon"
gem "faraday", "~> 1.1.0"
gem "faraday_middleware", "~> 1.0.0"
gem "redis-rack-cache"
gem "redis"
gem "roda"

group :development, :test do
  gem "byebug"
  gem "devup"
  gem "rack-test"
  gem "rspec", "~> 3.0"
  gem "shotgun"
  gem "warning"
end
