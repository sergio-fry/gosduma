module Gosduma
  class Members
    include Enumerable
    extend Dry::Initializer
    option :limit

    def each
      10.times do
        yield Member.new(1)
      end
    end
  end
end
