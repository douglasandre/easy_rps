require 'spec_helper'

describe 'EasyRps::Issuer' do

  REQUIRED_METHODS = [:lala]
  let(:issuer)  { Business.create! }
  let(:taker)   { create_user }

  REQUIRED_METHODS.each do |method|
    it "requires the method #{method} from the issuer" do
      expect(issuer.send(method)).to raise_error(EasyRps::RequiredMethod)
    end
  end

end
