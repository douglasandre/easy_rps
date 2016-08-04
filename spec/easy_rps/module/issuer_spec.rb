require 'spec_helper'

describe EasyRps::Modules::Issuer do

  REQUIRED_ATTRIBUTES = [:municipal_inscription]
  let(:issuer)  { Business.create! }

  REQUIRED_ATTRIBUTES.each do |attribute|
    it "requires the attribute #{attribute} from the issuer" do
      expt_message = "You need to implement the #{attribute} method on your class, or configure an alias to use EasyRps"
      expect(issuer.send(attribute)).to raise_error(expt_message)
    end
  end

end
