require 'spec_helper'

RSpec.describe GpsUnitConversion::MinutesToDecimal::Latitude do
  it 'converts latitude' do
    latitude_with_minutes = '5348.4338'

    expect(described_class.new(latitude: latitude_with_minutes).convert).to eq 53.81205
  end

  it 'converts latitude with mored digits' do
    latitude_with_minutes = '5348.43380000'

    expect(described_class.new(latitude: latitude_with_minutes).convert).to eq 53.81205
  end

  it 'more examples' do
    latitude_with_minutes = '434343.3416'
    expect(described_class.new(latitude: latitude_with_minutes).convert).to eq 43.728706

    latitude_with_minutes = '115900.1234'
    expect(described_class.new(latitude: latitude_with_minutes).convert).to eq 11.983368

    latitude_with_minutes = '811112.0006'
    expect(described_class.new(latitude: latitude_with_minutes).convert).to eq 81.186667

    latitude_with_minutes = '295423.8926'
    expect(described_class.new(latitude: latitude_with_minutes).convert).to eq 29.906637
  end

  it 'converts on southern hemisphere' do
    latitude_with_minutes = '5348.4338'

    expect(described_class.new(latitude: latitude_with_minutes, direction: 'S').convert).to eq -53.81205
  end
end
