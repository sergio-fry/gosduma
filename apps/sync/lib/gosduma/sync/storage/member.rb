module Gosduma
  module Sync
    module Storage
      class Member
        extend Dry::Initializer
        option :id
        option :name
      end
    end
  end
end
