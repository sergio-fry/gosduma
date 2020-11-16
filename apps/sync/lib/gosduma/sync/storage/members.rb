require "json"

require_relative "member"

module Gosduma
  module Sync
    module Storage
      class Members
        include Enumerable
        include Import["redis"]

        def <<(member)
          redis.hset :members, member.id, serialize(member)
        end

        def each
          redis.hgetall(:members).each { |k, m| yield deserialize(m) }
        end

        def serialize(member)
          {
            id: member.id,
            name: member.name
          }.to_json
        end

        def deserialize(data)
          attrs = JSON.parse data, symbolize_names: true

          Member.new(
            id: attrs[:id],
            name: attrs[:name]
          )
        end
      end
    end
  end
end
