module EasyRps
  module Printers
    class Header < Register

      def initialize(rps)
        super(rps)
        @template = File.read("#{template_base_path}/_rps_header.txt")
      end

    end
  end
end