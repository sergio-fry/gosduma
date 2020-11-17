require "gosduma/external/duma_response"
require "gosduma/member"

module Gosduma
  class Members
    include Enumerable
    extend Dry::Initializer

    def each
      resp = External::DumaResponse.new("deputies", params: {position: "Депутат ГД", current: 1}).call

      resp.each do |item|
        yield Member.new(
          item[:id],
          name: item[:name],
          position: item[:position]
        )
      end
    end
  end
end
