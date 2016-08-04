module EasyRps
  module Printers
    class BasePrinter

      attr_reader :header, :itens, :footer, :rps

      def initialize(rps)
        @rps  = rps
      end

      def print
        @header = Header.new(rps).print
        # rps.rps_itens.each do |item|
        #   @itens += Line.new(item).print
        # end
        # @footer = Footer.new(rps).print
        # @header + @itens + @footer
      end

    end
  end
end