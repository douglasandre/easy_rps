require 'spec_helper'

describe EasyRps::Modules::Issuer do

  required_attributes = [:municipal_inscription]
  let(:issuer)  { Business.create! }
  
  required_attributes.each do |attribute|
    pending "throw an error for not implemented #{attribute}"
    # it "requires the attribute #{attribute} from the issuer" do
    #   expt_message = "You need to implement the #{attribute} method on your class, or configure an alias to use EasyRps"
    #   expect(issuer.send(attribute)).to raise_error(expt_message)
    # end
  end

end
