module GpsUnitConversion
  module MinutesToDecimal
    class Latitude
      attr_reader :latitude, :direction

      def initialize(latitude:, direction: 'N')
        @latitude = latitude
        @direction = direction
      end

      def convert
        decimal = (degrees + (minutes/60.0) + (seconds/3600.0)).round(DEFAULT_DECIMALS)
        direction == 'N' ? decimal : -decimal
      end

      private

      def value
        numbers = latitude.gsub(/\D/, "")
        @value ||= numbers[0] == '0' ? numbers[1..-1] : numbers
      end

      def degrees
        value[0..1].to_i
      end

      def minutes
        value[2..3].to_i
      end

      def seconds
        base = value[4..-1]
        base.length > 2 ? base.insert(2, '.').to_f : base.to_f
      end
    end
  end
end
