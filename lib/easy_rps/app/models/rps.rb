require "rubygems"
require "active_record"

module EasyRps
  class Rps < ActiveRecord::Base

    self.table_name = 'rps'

    attr_accessor :issuer, :rps_itens, :printer

    def initialize(issuer, rps_itens, options={})
      super(options)
      self.issuer     = issuer
      self.printer    = Printers::BasePrinter.new(self)
      valid_params?(issuer, rps_itens, options={})
      auto_fill(rps_itens) unless errors.any?
    end
    
    def print_and_save
      ActiveRecord::Base.transaction do
        print && save! && save_itens
      end
    end


    private

    def valid_params?(issuer, rps_itens, options={})
      self.errors.add(:rps_itens, 'Não há vendas suficientes para emissão de RPS') unless rps_itens && rps_itens.length > 0
      self.errors.add(:printer, "Ainda não é possível imprimir RPS para #{issuer.state}/#{issuer.city}") unless printer.existent_configuration?
    end

    def save_itens
      rps_itens.each do |item|
        item.update!(rps_id: self.id, rps_item_id: item.rps_item_id)
      end
    end

    def print
      self.printed_text = @printer.print
    end

    def auto_fill(rps_itens)
      self.first_item_id  = (issuer.rps.order('created_at DESC').first.try(:last_item_id) || 0) + 1
      self.issuer_id      = issuer.id
      self.issuer_type    = issuer.class.name
      self.rps_itens      = rps_itens.each_with_index do|item, idx|
                              item.rps_item_id  = idx + first_item_id
                            end
      self.start_date     = @rps_itens.first.emitted_on
      self.end_date       = @rps_itens.last.emitted_on
      self.last_item_id   = self.first_item_id + @rps_itens.length - 1
    end

  end
end