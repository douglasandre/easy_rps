module EasyRps
  module Printers
    class Footer < Register

      def initialize(rps)
        super(rps)
        @template = File.read("#{template_base_path}/_rps_footer.txt")
      end

      def print
        printed = @template
        @config.each do |attr_conf|
          field   = RpsField.new(attr_conf[0], attr_conf[1].merge(fields))
          printed = printed.gsub("\{#{field.key}\}", field.formatted_value)
        end
        printed
      end

      def fields
        {
          'rps' => rps,
          'total_tax_amount' => @rps.rps_itens.map(&:tax_amount).reduce(:+),
          'total_amount' => @rps.rps_itens.map(&:amount_in_cents).reduce(:+),
          'total_itens' => @rps.rps_itens.length
        }
      end

    end
  end
end