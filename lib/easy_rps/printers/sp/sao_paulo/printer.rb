module EasyRps
  module Printers
    module SP
      module SaoPaulo
        class Printer

          attr_reader :header, :itens, :footer, :issuer, :taker, :rps_itens

          def initialize(issuer, taker, rps_itens)
            @issuer     = issuer
            @taker      = taker
            @rps_itens  = rps_itens
          end

          def print(rps)
            
          end

        end
      end
    end
  end
end