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
      expected  = "90000010000000004665034000000000000000"
      expect(footer.print).to eq(expected)
    end
  end
end
