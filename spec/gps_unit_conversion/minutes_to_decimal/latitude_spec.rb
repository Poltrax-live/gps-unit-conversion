require 'spec_helper'

RSpec.describe GpsUnitConversion::MinutesToDecimal::Latitude do
  it 'converts latitude' do
    latitude_with_minutes = '5348.4338'

    expect(described_class.new(latitude: latitude_with_minutes).convert).to eq 53.81205
  end

  it 'converts on southern hemisphere' do
    latitude_with_minutes = '5348.4338'

    expect(described_class.new(latitude: latitude_with_minutes, direction: 'S').convert).to eq -53.81205
  end
end
