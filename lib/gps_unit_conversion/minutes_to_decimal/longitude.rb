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
        @value  ||= longitude.gsub(/\D/, "")
      end

      def degrees
        value[0..2].to_i
      end

      def minutes
        value[3..4].to_i
      end

      def seconds
        base = value[5..-1]
        base.length > 2 ? base.insert(2, '.').to_f : base.to_f
      end
    end
  end
end
