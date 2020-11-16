require "roda"

require "gosduma"

module Gosduma
  module Web
    class App < Roda
      plugin :json
      plugin :public
      plugin :caching

      include Import["members"]

      route do |r|
        r.public
        r.root do
          r.redirect "/index.html"
        end

        r.on "api" do
          r.is "members" do
            response.cache_control public: true, max_age: 60

            members.call(limit: 1000)
              .take(300)
              .map { |member|
                {id: member.id, name: member.name, presence: member.presence}
              }
          end
        end
      end
    end
  end
end
