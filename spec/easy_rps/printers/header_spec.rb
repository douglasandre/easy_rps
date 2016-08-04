require 'spec_helper'

describe EasyRps::Printers::Header do

  let(:issuer)  { Business.create!(municipal_inscription: '123456789', state: 'SP', city: 'São Paulo') }
  let(:taker)   { User.create! }
  let(:items)   { [Sale.create!(service: Service.create!),
                   Sale.create!(service: Service.create!)] }
  let(:rps)     { EasyRps::Rps.new(issuer, taker, items) }

  describe '#print' do
    it 'prints the rps header correctly' do
      header = EasyRps::Printers::Header.new(rps)
      expect(header.print).to eq('1002513391612016071320160713')
    end
  end
end
