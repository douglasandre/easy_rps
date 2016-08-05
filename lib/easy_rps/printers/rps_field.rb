module EasyRps
  module Printers
    class RpsField

      attr_reader :options, :key, :value, :size, :type, :rps

      def initialize(rps, key, options = {})
        @rps        = rps
        @key        = key
        @options    = options
        @value      = load_value
        @size       = options['size']
        @type       = options['type']
        @fill       = options['fill'] || false
        @fill_char  = options['fill_char'] || "0"
      end

      def load_value
        if @options['dynamic']
          eval('rps.' + @options['value'])
        else
          @options['value']
        end
      end

      def formatted_value
        raise "Invalid length for #{@key}. Expected: #{@size}. Received: #{@value.length}. #{@value}" if @value.length > @size.to_i
        @fill ? fill_field : @value
      end

      def fill_field
        while @value.length < @size do
          if @type == 'num'
            @value = @fill_char + @value
          else
            @value << @fill_char
          end
        end
        @value
      end

    end
  end
end