module EasyRps
  module Printers
    class Footer
      TEMPLATE = 'templates/STATE/CITY/_rps_footer.txt'

      attr_reader :rps

      def initialize(rps)
        @rps  = rps
      end

      def print(rps)
        
      end

    end
  end
end