module EasyRps
  module Printers
    class Header < Register
      attr_reader :rps, :template, :printed

      def initialize(rps)
        super(rps)
        @template = File.read("#{template_base_path}/_rps_header.txt")
      end

      def fields
        {
          type: {
            key:    '{REGISTER_TYPE}',
            value:  '1',
            size:   1,
            type:   'num'},
          file_version: {
            key:    '{FILE_VERSION}',
            value:  '002',
            size:   3,
            type:   'num' },
          municipal_inscription: {
            key:    '{MUNICIPAL_INSCRIPTION}',
            value:  rps.issuer.municipal_inscription,
            size:   8,
            type:   'num',
            fill:   true },
          start_date: {
            key:    '{START_DATE}',
            value:  rps.start_date.strftime('%Y%m%d'),
            size:   8,
            type:   'num' },
          end_date: {
            key:    '{END_DATE}',
            value:  rps.end_date.strftime('%Y%m%d'),
            size:   8,
            type:   'num' }
        }
      end

      def print
        printed = @template
        fields.each do |f_attr|
          field = RpsField.new(f_attr[1])
          printed = printed.gsub(field.key, field.formatted_value)
        end
        printed
      end
    end
  end
end