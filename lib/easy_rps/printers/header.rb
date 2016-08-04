module EasyRps
  module Printers
    class Header < Register
      attr_reader :rps, :template, :printed

      def initialize(rps)
        super(rps)
        @template = File.read("#{template_base_path}/_rps_header.txt")
      end

      def print
        printed = @template
        replaces.each do |item, value|
          printed = printed.gsub(item, value)
        end
        printed
      end

      private

      def replaces
        { "{REGISTER_TYPE}"         => "1",
          "{FILE_VERSION}"          => "002",
          "{MUNICIPAL_INSCRIPTION}" => rps.issuer.municipal_inscription,
          "{START_DATE}"            => rps.start_date.strftime('%Y%m%d'),
          "{END_DATE}"              => rps.end_date.strftime('%Y%m%d') }
      end

    end
  end
end