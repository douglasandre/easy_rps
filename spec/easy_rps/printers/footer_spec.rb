require 'spec_helper'

describe EasyRps::Printers::Footer do

  let(:issuer)  { Business.create!(municipal_inscription: '12345', state: 'SP', city: 'São Paulo') }
  let(:taker)   { User.create! }
  let(:service) { Service.create!(name: 'Banho') }
  let(:items)   { [Sale.create!(service: service, amount: '62,50', user: taker),
                   Sale.create!(service: service, amount: '79,90', user: taker)] }
  let(:rps)     { EasyRps::Rps.new(issuer, items) }

  describe '#print', footer: true do
    it 'prints the rps footer correctly' do
      footer    = EasyRps::Printers::Footer.new(rps)
      total_itens       = fill_field(rps.rps_itens.length, 7)
      total_amount      = fill_field(rps.rps_itens.map(&:amount_in_cents).reduce(:+), 15)
      total_tax_amount  = fill_field(rps.rps_itens.map(&:tax_amount).reduce(:+), 15)
      expect(footer.print).to eq("9#{total_itens}#{total_amount}#{total_tax_amount}")
    end
  end
end
