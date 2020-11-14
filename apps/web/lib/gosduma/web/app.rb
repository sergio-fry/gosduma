require "roda"

require "gosduma"
require "gosduma/members"

module Gosduma
  module Web
    class App < Roda
      plugin :json

      route do |r|
        r.root do
          r.redirect "/api/list"
        end

        r.on "api" do
          r.get "list" do
            members = Members.new(limit: 10)

            members.map do |member|
              {}
            end
          end
        end
      end
    end
  end
end
