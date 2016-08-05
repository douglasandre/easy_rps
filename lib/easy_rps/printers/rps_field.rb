module EasyRps
  module Printers
    class RpsField

      attr_reader :key, :value, :size, :type

      def initialize(options = {})
        @key        = options[:key]
        @value      = options[:value]
        @size       = options[:size]
        @type       = options[:type]
        @fill       = options[:fill] || false
        @fill_char  = options[:fill_char] || "0"
      end

      def formatted_value
        raise "Invalid length for #{@key}. Expected: #{@size}. Received: #{@value.length}. #{@value}" if @value.length > @size.to_i
        @fill ? fill_field : @value
      end

      def fill_field
        while @value.length < @size do
          @value = @fill_char + @value
        end
        @value
      end

    end
  end
end