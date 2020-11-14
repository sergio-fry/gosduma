require "warning"

Gem.loaded_specs["roda"].full_require_paths.each do |path|
  Warning.ignore(:missing_ivar, path)
end
