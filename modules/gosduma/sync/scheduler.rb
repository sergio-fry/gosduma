require "rufus-scheduler"

module Gosduma
  module Sync
    class Schdeduler
      include Import["members", storage: "storage.members"]

      def run
        rufus.every "1h", first_in: "10s", overlap: false do
          store_members
        end

        rufus.join
      end

      def rufus
        @rufus ||= Rufus::Scheduler.new
      end

      def store_members
        members.each do |member|
          storage << member
        end
      end
    end
  end
end
