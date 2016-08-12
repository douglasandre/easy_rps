module EasyRps
  module Printers
    class BasePrinter

      attr_reader :header, :details, :footer, :rps

      def initialize(rps)
        @rps  = rps
      end

      def existent_configuration?
        File.exist?("lib/easy_rps/printers/#{sanitize(@rps.issuer.state)}/#{sanitize(@rps.issuer.city)}/config.yml")
      end

      def print
        @details = ''
        @header = "#{Header.new(rps).print}\r\n"
        rps.rps_itens.each do |item|
          @details += "#{Detail.new(rps, item).print}\r\n"
        end
        @footer = "#{Footer.new(rps).print}\r\n"
        @header + @details + @footer
      end

      private

      def sanitize(expression)
        expression.parameterize.gsub('-', '_')
      end

    end
  end
end