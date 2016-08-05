require 'spec_helper'

describe EasyRps::Rps do

  let(:issuer)  { Business.create!(municipal_inscription: '12345', state: 'SP', city: 'São Paulo') }
  let(:taker)   { User.create! }
  let(:service) { Service.create!(name: 'Banho') }
  let(:items)   { [Sale.create!(service: service, amount: '62,50', user: taker),
                   Sale.create!(service: service, amount: '79,90', user: taker)] }
  let(:rps)     { EasyRps::Rps.new(issuer, items) }

  describe '#print' do
    it 'prints the rps header correctly' do
      expect(rps.print).to eq('')
    end    
  end

end
