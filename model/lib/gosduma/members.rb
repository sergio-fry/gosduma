require "gosduma/external/duma_response"

module Gosduma
  class Members
    include Enumerable
    extend Dry::Initializer
    option :limit

    def each
      resp = External::DumaResponse.new("deputies", position: "Депутат ГД", current: 1).call

      resp.each do |item|
        yield Member.new(1)
      end
    end
  end
end
