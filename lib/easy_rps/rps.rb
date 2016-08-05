module EasyRps
  class Rps

    attr_reader :issuer, :taker, :rps_itens, :printer

    def initialize(issuer, rps_itens)
      @issuer     = issuer
      @rps_itens  = rps_itens
      @printer    = Printers::BasePrinter.new(self)
    end
    
    def start_date
      @rps_itens.sort_by{|a| a.emitted_on}.first.emitted_on
    end

    def end_date
      @rps_itens.sort_by{|a| a.emitted_on}.last.emitted_on
    end

    def print
      @printer.print
    end
  end
end