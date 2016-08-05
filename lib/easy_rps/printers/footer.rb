module EasyRps
  module Printers
    class Footer < Register

      def initialize(rps)
        super(rps)
        @template = File.read("#{template_base_path}/_rps_footer.txt")
      end

    end
  end
end