require 'yaml'

module EasyRps
  module Printers
    class Register
      attr_reader :rps, :template_base_path, :complete_config, :config, 
                  :template, :printed

      def initialize(rps)
        @rps                = rps
        @template_base_path = base_path('templates')
        @complete_config    = YAML.load_file("#{base_path('printers')}/config.yml")
        @config             = load_config
      end

      def print
        printed = @template
        @config.each do |attr_conf|
          field   = RpsField.new(@rps, attr_conf[0], attr_conf[1])
          printed = printed.gsub("\{#{field.key}\}", field.formatted_value)
        end
        printed
      end

      private

      def load_config
        state         = sanitize(@rps.issuer.state)
        city          = sanitize(@rps.issuer.city)
        register_type = self.class.name.demodulize.downcase
        @complete_config['printers'][state][city][register_type]
      end

      def sanitize(expression)
        expression.parameterize.gsub('-', '_')
      end

      def base_path(path)
        "lib/easy_rps/#{path}/#{sanitize(@rps.issuer.state)}/#{sanitize(@rps.issuer.city)}"
      end
    end
  end
end