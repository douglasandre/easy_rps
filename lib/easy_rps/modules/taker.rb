module EasyRps
  module Modules
    # Used for identifier the issuer of the RPS
    # Your model need to respond to the following methods:
    #   * doc (Value of CPF / CNPJ)
    #   * doc_type (Type of the document - CPF / CNPJ)
    #
    # TODO
    # If your have this information with another name in your model, 
    # so you need configure this module like this:
    # easy_rps issuer: { doc: FIELD_IN_YOUR_SYSTEM }
    #
    module Taker

      # Your class need to respond to these calls, 
      # using an attribute or method
      def self.required_responses
        [:doc, :doc_type]
      end
    end
  end
end