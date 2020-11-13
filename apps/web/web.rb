require "roda"

require "gosduma"

module Gosduma
  class Web < Roda
    route do |r|
      r.root do
        r.redirect "/list"
      end

      r.get "list" do
        "Hey!"
      end
    end
  end
end
