module EasyRps
  module Printers
    class Register
      attr_reader :rps, :template_base_path

      def initialize(rps)
        @rps  = rps
        current_path = "#{File.expand_path(File.dirname(__FILE__))}"
        @template_base_path = "lib/easy_rps/templates/#{sanitize(rps.issuer.state)}/#{sanitize(rps.issuer.city)}"
      end

      private

      def sanitize(expression)
        expression.parameterize.gsub('-', '_')
      end

    end
  end
end