module EasyRps
  module Printers
    class Detail < Register
      attr_reader :rps_item

      def initialize(rps, rps_item)
        super(rps)
        @rps_item = rps_item
        @template = File.read("#{template_base_path}/_rps_detail.txt")
      end

      def print
        printed = @template
        @config.each do |attr_conf|
          field   = RpsField.new(attr_conf[0], attr_conf[1].merge('rps' => rps, 'rps_item' => rps_item))
          printed = printed.gsub("\{#{field.key}\}", field.formatted_value)
        end
        printed
      end

    end
  end
end