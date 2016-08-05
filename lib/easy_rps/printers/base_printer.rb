module EasyRps
  module Printers
    class BasePrinter

      attr_reader :header, :details, :footer, :rps

      def initialize(rps)
        @rps  = rps
      end

      def print
        @details = ''
        @header = "#{Header.new(rps).print}\n"
        rps.rps_itens.each do |item|
          @details += "#{Detail.new(rps, item).print}\n"
        end
        # @footer = Footer.new(rps).print
        @header + @details# + @footer
      end
    end
  end
end