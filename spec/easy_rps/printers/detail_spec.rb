require 'spec_helper'

describe EasyRps::Printers::Detail do

  let(:issuer)  { Business.create!(municipal_inscription: '12345', state: 'SP', city: 'São Paulo') }
  let(:taker)   { User.create! }
  let(:items)   { [Sale.create!(service: Service.create!),
                   Sale.create!(service: Service.create!)] }
  let(:rps)     { EasyRps::Rps.new(issuer, taker, items) }

  describe '#print' do
    it 'prints an rps item correctly' do
      item      = EasyRps::Printers::Detail.new(rps, items.first)
      expected = "3RPS-C5    00000000086920160713T0000000000200000000000000000000864802002100036473148892SERVICE DESCRIPTION"
      expect(item.print).to eq(expected)
    end
  end
end
