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

        def find_by_id(id)
          find { |el| el.id == id }
        end

        def clear
          redis.del :members
        end

        def serialize(member)
          {
            id: member.id,
            name: member.name,
            position: member.position,
            presence: member.presence
          }.to_json
        end

        def deserialize(data)
          attrs = JSON.parse data, symbolize_names: true

          Member.new(
            id: attrs[:id],
            name: attrs[:name],
            position: attrs[:position],
            presence: attrs[:presence]
          )
        end
      end
    end
  end
end
