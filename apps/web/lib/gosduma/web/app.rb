require "roda"

require "gosduma"

module Gosduma
  module Web
    class App < Roda
      plugin :json
      plugin :public

      include Import["members"]

      route do |r|
        r.root do
          r.redirect "/api/members"
        end

        r.on "api" do
          r.is "members" do
            members.call(limit: 1000).take(5).map do |member|
              {id: member.id, name: member.name, presence: member.presence}
            end
          end
        end
      end
    end
  end
end
