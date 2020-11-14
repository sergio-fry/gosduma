require "roda"

require "gosduma"

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
            []
          end
        end
      end
    end
  end
end
