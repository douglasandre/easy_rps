require 'spec_helper'

describe EasyRps::Printers::Detail do

  let(:issuer)  { Business.create!(municipal_inscription: '12345', state: 'SP', city: 'São Paulo') }
  let(:taker)   { User.create!(cpf: '661.539.276-37') }
  let(:service) { Service.create!(name: 'Consulta Veterinária') }
  let(:items)   { [Sale.create!(service: service, amount: '62,50', user: taker),
                   Sale.create!(service: service, amount: '79,90', user: taker)] }
  let(:item)    { items.first }
  let(:rps)     { EasyRps::Rps.new(issuer, items) }

  describe '#print', detail: true do
    it 'prints an rps item correctly' do
      detail          = EasyRps::Printers::Detail.new(rps, item)
      config          = detail.complete_config['printers']['sp']['sao_paulo']
      rps_serie       = fill_field(config['detail']['rps_serie']['value'], 5, ' ', 'text')
      rps_number      = fill_field(item.rps_item_id, 12)
      emitted_on      = fill_field(item.emitted_on.strftime('%Y%m%d'), 8)
      rps_status      = item.rps_status
      amount          = fill_field(item.amount_in_cents, 15)
      tax_amount      = fill_field(item.tax_amount, 15)
      service_code    = fill_field(item.service_code, 5)
      aliquot         = fill_field(item.aliquot, 4)
      iss_withheld    = fill_field(item.iss_withheld, 1)
      taker_doc_type  = fill_field(item.taker.taker_doc_type, 1)
      taker_doc_value = fill_field(item.taker.taker_doc_value, 14)
      rps_description = item.rps_description.upcase
      expected_impression = "3RPS-C#{rps_serie}#{rps_number}#{emitted_on}#{rps_status}#{amount}#{tax_amount}#{service_code}#{aliquot}#{iss_withheld}#{taker_doc_type}#{taker_doc_value}#{rps_description}"
      expect(detail.print).to eq(expected_impression)
    end
  end
end
