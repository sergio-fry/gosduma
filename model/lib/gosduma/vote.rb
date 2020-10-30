require "dry-initializer"

module Gosduma
  class Vote
    extend Dry::Initializer
    param :result, type: Types::String.enum("for", "against", "abstain", "absent")
  end
end
