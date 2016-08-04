module EasyRps
  module Modules
    # Used for identifier the issuer of the RPS
    # Your model need to respond to the following methods:
    #   * emitted_on
    #   * rps_status
    #   * amount
    #   * tax_amount
    #   * service_code
    #   * aliquot
    #   * iss
    #   * description
    #
    # TODO
    # If your have this information with another name in your model, 
    # so you need configure this module like this:
    # easy_rps issuer: { emitted_on: FIELD_IN_YOUR_SYSTEM }
    #
    module RpsItem
      
      # Your class need to respond to these calls, 
      # using an attribute or method
      def self.required_responses
        [:emitted_on, :rps_status, :amount, :tax_amount,
         :service_code, :aliquot, :iss, :rps_description]
      end
    end
  end
end