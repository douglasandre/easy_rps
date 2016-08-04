require 'spec_helper'

describe EasyRps::Modules::Taker do

  let(:taker)  { User.create! }

  REQUIRED_ATTRIBUTES = [:doc, :doc_type]
  
  REQUIRED_ATTRIBUTES.each do |attribute|
    it "requires the attribute #{attribute} from the taker" do
      expt_message = "You need to implement the #{attribute} method on your class, or configure an alias to use EasyRps"
      expect(taker.send(attribute)).to raise_error(expt_message)
    end
  end

end
