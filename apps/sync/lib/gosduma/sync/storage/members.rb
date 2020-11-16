module Gosduma
  module Sync
    module Storage
      class Members
        include Enumerable

        def initialize
          @members = []
        end

        def <<(member)
          @members << member
        end

        def each
          @members.each { |m| yield m }
        end
      end
    end
  end
end
