require 'spec_helper'

describe EasyRps::Printers::Detail do

  let(:issuer)  { Business.create!(municipal_inscription: '12345', state: 'SP', city: 'São Paulo') }
  let(:taker)   { User.create! }
  let(:service) { Service.create!(name: 'Banho') }
  let(:items)   { [Sale.create!(service: service, amount: '62,50', user: taker),
                   Sale.create!(service: service, amount: '79,90', user: taker)] }
  let(:rps)     { EasyRps::Rps.new(issuer, items) }

  describe '#print', detail: true do
    it 'prints an rps item correctly' do
      item      = EasyRps::Printers::Detail.new(rps, items.first)
      expected = "3RPS-C5    00000000086920160713T0000000000200000000000000000000864802002100036473148892SERVICE DESCRIPTION"
      expect(item.print).to eq(expected)
    end
  end
end
