module EasyRps
  class Rps

    attr_reader :issuer, :taker, :rps_itens

    def initialize(issuer, taker, rps_itens)
      @issuer     = issuer
      @taker      = taker
      @rps_itens  = rps_itens
    end
    
    def start_date
      @rps_itens.sort_by{|a| a.emitted_on}.first.emitted_on
    end

    def end_date
      @rps_itens.sort_by{|a| a.emitted_on}.last.emitted_on
    end

    def print
      "#{@issuer.state}::#{@issuer.city}::Printer.print".constantize.send(self)
    end
  end
end