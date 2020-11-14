require "roda"

require "gosduma"

module Gosduma
  module Web
    class App < Roda
      plugin :json

      include Import["members"]

      route do |r|
        r.root do
          r.redirect "/api/members"
        end

        r.on "api" do
          r.is "members" do
            members.call(limit: 1000).map do |member|
              {id: member.id, name: member.name}
            end
          end

          r.on "members" do
            r.on String do |member_id|
              r.is "stats" do
                r.get do
                  member = Member.new(member_id)
                  {id: member.id, presence: member.presence}
                end
              end
            end
          end
        end
      end
    end
  end
end
