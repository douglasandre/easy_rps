require 'spec_helper'

describe EasyRps::Modules::RpsItem do

  let(:rps_item)  { Product.create! }

  REQUIRED_ATTRIBUTES = [ :emitted_on,
                          :rps_status,
                          :amount,
                          :tax_amount,
                          :service_code,
                          :aliquot,
                          :iss,
                          :description ]
  
  REQUIRED_ATTRIBUTES.each do |attribute|
    it "requires the attribute #{attribute} from the rps_item" do
      expt_message = "You need to implement the #{attribute} method on your class, or configure an alias to use EasyRps"
      expect(rps_item.send(attribute)).to raise_error(expt_message)
    end
  end

end
