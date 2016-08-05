require 'spec_helper'

describe EasyRps::Printers::Header do

  let(:issuer)  { Business.create!(municipal_inscription: '12345', state: 'SP', city: 'São Paulo') }
  let(:taker)   { User.create! }
  let(:items)   { [Sale.create!(service: Service.create!),
                   Sale.create!(service: Service.create!)] }
  let(:rps)     { EasyRps::Rps.new(issuer, taker, items) }

  describe '#print' do
    it 'prints the rps header correctly' do
      header    = EasyRps::Printers::Header.new(rps)
      expected  = "100200012345#{rps.start_date.strftime('%Y%m%d')}#{rps.end_date.strftime('%Y%m%d')}"
      expect(header.print).to eq(expected)
    end

    it 'raises an error when any data are invalid' do
      issuer  = Business.create!(municipal_inscription: '1234567890', state: 'SP', city: 'São Paulo')
      rps     = EasyRps::Rps.new(issuer, taker, items)
      header  = EasyRps::Printers::Header.new(rps)
      expected_message = 'Invalid length for {municipal_inscription}. Expected: 8. Received: 10. 1234567890'
      expect { header.print }.to raise_error(RuntimeError)
    end
  end
end
