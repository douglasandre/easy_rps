module EasyRps
  module Printers
    class Item

      TEMPLATE = 'templates/STATE/CITY/_rps_item.txt'

      attr_reader :rps, :template

      def initialize(rps)
        @rps  = rps
      end

      def print
        Header.new(rps).print
      end

    end
  end
end