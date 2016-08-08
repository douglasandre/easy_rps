require "rubygems"
require "active_record"

module EasyRps
  class Rps < ActiveRecord::Base

    self.table_name = 'rps'

    attr_accessor :issuer, :taker, :rps_itens, :printer

    def initialize(issuer, rps_itens, options={})
      super(options)
      self.issuer     = issuer
      self.printer    = Printers::BasePrinter.new(self)
      auto_fill(rps_itens)
    end
    
    def print_and_save
      print && save!
    end

    private

    def print
      self.printed_text = @printer.print
    end

    def auto_fill(rps_itens)
      self.issuer_id      = issuer.id
      self.issuer_type    = issuer.class.name
      self.rps_itens      = rps_itens.sort_by{|a| a.rps_item_id}
      self.start_date     = @rps_itens.first.emitted_on
      self.end_date       = @rps_itens.last.emitted_on
      self.first_item_id  = (Rps.order('id DESC').first.try(:last_item_id) || 0) + 1
      self.last_item_id   = self.first_item_id + @rps_itens.length
    end

  end
end