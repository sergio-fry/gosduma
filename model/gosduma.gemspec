require_relative "lib/gosduma/version"

Gem::Specification.new do |spec|
  spec.name = "gosduma"
  spec.version = Gosduma::VERSION
  spec.authors = ["Sergei O. Udalov"]
  spec.email = ["sergei.udalov@gmail.com"]

  spec.summary = "Empty"
  spec.description = "Empty"
  spec.homepage = "http://example.com"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "dry-auto_inject", "~> 0.7.0"
  spec.add_runtime_dependency "dry-container", "~> 0.7.2"
  spec.add_runtime_dependency "dry-initializer", "~> 3.0.4"
  spec.add_runtime_dependency "dry-types", "~> 1.4.0"
  spec.add_runtime_dependency "faraday", "~> 1.1.0"
end
