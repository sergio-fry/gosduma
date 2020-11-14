require "roda"

require "gosduma"

module Gosduma
  module Web
    class App < Roda
      plugin :json

      include Import["members"]

      route do |r|
        r.root do
          r.redirect "/api/list"
        end

        r.on "api" do
          r.get "list" do
            members.call(limit: 10).map do |member|
              {id: member.id, name: member.name}
            end
          end
        end
      end
    end
  end
end
