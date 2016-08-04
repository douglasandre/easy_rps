module EasyRps
  module Modules
    # Used for identifier the issuer of the RPS
    # Your model need to respond to the following methods:
    #   * municipal_inscription
    #
    # TODO
    # If your have this information with another name in your model,
    # so you need configure this module like this:
    # easy_rps issuer: { municipal_inscription: FIELD_IN_YOUR_SYSTEM }
    #
    module Issuer

      # Your class need to respond to these calls, 
      # using an attribute or method
      def self.required_responses
        [:municipal_inscription]
      end

    end
  end
end