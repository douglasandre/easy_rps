module EasyRps
  module Printers
    class RpsField

      attr_reader :options, :key, :value, :size, :type, :rps, :fixed

      def initialize(key, options = {})
        options.except('fill', 'fill_char', 'value', 'dynamic').each do |option, value|
          instance_variable_set("@#{option}", value)
        end
        @key        = key
        @value      = load_value_from_options(options)
        @fill       = options['fill'] || false
        @fill_char  = options['fill_char'] || "0"
      end

      def load_value_from_options(options)
        options['dynamic'] ? eval(options['value']).to_s : options['value']
      end

      def formatted_value
        raise "Invalid length for #{@key}. Expected: #{@size}. Received: #{@value.length}. #{@value}" if @value.length > @size.to_i
        send("format_#{@type}") if (@type == 'num' || @type == 'text') && !@fixed
        @value = @fill ? fill_field : @value
        @value
      end

      def format_num
        @value = @value.gsub(/[^0-9A-Za-z]/, '')
      end

      def format_text
        @value = @value.parameterize.upcase.gsub('-', ' ').gsub(/[^0-9A-Za-z ]/, '')
      end

      def fill_field
        @value = @value.to_s
        while @value.to_s.length < @size do
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