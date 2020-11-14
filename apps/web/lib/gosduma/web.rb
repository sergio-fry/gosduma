require "dry-auto_inject"

$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), "..")))

module Gosduma
  module Web
    class Container
      extend Dry::Container::Mixin

      register("members") do
        require "gosduma/members"
        ->(*args) { Members.new(*args) }
      end
    end

    Import = Dry::AutoInject(Container)
  end
end
