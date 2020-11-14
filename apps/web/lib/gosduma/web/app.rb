require "roda"

require "gosduma"
require "gosduma/web/cached_member"

module Gosduma
  module Web
    class App < Roda
      plugin :json
      plugin :public

      include Import["members"]

      route do |r|
        r.public
        r.root do
          r.redirect "/index.html"
        end

        r.on "api" do
          r.is "members" do
            members.call(limit: 1000)
              .take(200)
              .map { |member|
                {id: member.id, name: member.name, presence: member.presence}
              }
          end
        end
      end
    end
  end
end
