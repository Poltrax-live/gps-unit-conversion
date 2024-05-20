require 'spec_helper'

RSpec.describe GpsUnitConversion::MinutesToDecimal::Longitude do
  it 'converts longitude' do
    longitude_with_minutes = '02034.4097'

    expect(described_class.new(longitude: longitude_with_minutes).convert).to eq 20.578047
  end

  it 'converts on western hemisphere' do
    longitude_with_minutes = '02034.4097'

    expect(described_class.new(longitude: longitude_with_minutes, direction: 'W').convert).to eq -20.578047
  end
end
