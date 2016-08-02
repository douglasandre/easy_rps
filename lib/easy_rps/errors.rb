module EasyRps
  module Errors
    
    class InvalidRPSModuleError < StandardError
      def initialize(attributes)
        @attributes = attributes
      end

      def message
        "Invalid module configuration. Please check the configuration of EasyRps in your model."
      end
    end

  end
end