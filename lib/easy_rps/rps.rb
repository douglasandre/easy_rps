module EasyRps
  class Rps

    attr_reader :issuer, :taker, :rps_itens

    def initialize(issuer, taker, rps_itens)
      @issuer     = issuer
      @taker      = taker
      @rps_itens  = rps_itens
    end
    
    def print(state, city)
      "#{state}::#{city}::Printer.print".constantize.send(self)
    end
  end
end