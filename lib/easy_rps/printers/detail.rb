module EasyRps
  module Printers
    class Detail < Register
      attr_reader :rps_item

      def initialize(rps, rps_item)
        super(rps)
        @rps_item = rps_item
        @template = File.read("#{template_base_path}/_rps_detail.txt")
      end
    end
  end
end