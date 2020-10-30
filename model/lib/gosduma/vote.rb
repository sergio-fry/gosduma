require "dry-initializer"
require "dry-types"

module Gosduma
  class Vote
    extend Dry::Initializer
    param :result, type: Dry.Types::String.enum("for", "against", "abstain",
      "absent")

    def absent?
      result == "absent"
    end
  end
end
