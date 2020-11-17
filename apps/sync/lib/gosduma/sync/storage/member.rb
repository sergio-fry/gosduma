module Gosduma
  module Sync
    module Storage
      class Member
        extend Dry::Initializer
        option :id
        option :name
        option :position
        option :presence
      end
    end
  end
end
