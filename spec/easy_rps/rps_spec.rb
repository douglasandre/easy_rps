require 'spec_helper'

describe EasyRps::Rps do

  let(:issuer)  { Business.create!(municipal_inscription: '12345', state: 'SP', city: 'São Paulo') }
  let(:taker)   { User.create! }
  let(:service) { Service.create!(name: 'Banho') }
  let(:items)   { [Sale.create!(service: service, amount: '62,50', user: taker),
                   Sale.create!(service: service, amount: '79,90', user: taker)] }
  let(:rps)     { EasyRps::Rps.new(issuer, items) }

  describe '#print_and_save', rps: true do
    it 'prints and saves the rps' do
      expect(rps.print_and_save).to be_truthy
    end

    it 'sets the printed_text correctly' do
      rps.print_and_save
      expect(rps.printed_text).not_to be_nil
    end
  end

end
