module Gosduma
  module Web
    class CachedMember
      extend Dry::Initializer
      param :member

      include Import["cache"]

      def id
        member.id
      end

      def name
        member.name
      end

      def presence
        cache.fetch("#{id}/presence") do
          member.presence
        end
      end
    end
  end
end
