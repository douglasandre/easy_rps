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
      extend  ActiveSupport::Concern

      included do
        before_create :set_rps_item_id
      end
      

      # Your class need to respond to these calls, 
      # using an attribute or method
      def self.required_responses
        [:emitted_on, :rps_status, :amount_in_cents, :tax_amount,
         :service_code, :aliquot, :iss_withheld, :rps_description, :taker, :rps_item_id]
      end

      def set_rps_item_id
        last_rps_item_id = self.class.maximum(:rps_item_id)
        self.rps_item_id = last_rps_item_id.to_i + 1
      end

    end
  end
end