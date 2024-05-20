module GpsUnitConversion
  module MinutesToDecimal
    class Longitude
      attr_reader :longitude, :direction

      def initialize(longitude:, direction: 'E')
        @longitude = longitude
        @direction = direction
      end

      def convert
        decimal = (degrees + (minutes/60.0) + (seconds/3600.0)).round(DEFAULT_DECIMALS)
        direction == 'E' ? decimal : -decimal
      end

      private

      def value
        numbers = longitude.gsub(/\D/, "")
        @value ||= numbers[0] == '0' ? numbers[1..-1] : numbers
      end

      def degrees
        value[0..1].to_i
      end

      def minutes
        value[2..3].to_i
      end

      def seconds
        value[4..-1].to_f / 100.0
      end
    end
  end
end
