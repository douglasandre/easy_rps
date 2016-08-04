require 'spec_helper'

describe EasyRps::Modules::Taker do

  required_attributes = [:doc, :doc_type]
  let(:taker)               { User.create! }
  
  required_attributes.each do |attribute|
    pending "throw an error for not implemented #{attribute}"
    # it "requires the attribute #{attribute} from the taker" do
    #   expt_message = "You need to implement the #{attribute} method on your class, or configure an alias to use EasyRps"
    #   expect(taker.send(attribute)).to raise_error(expt_message)
    # end
  end

end
