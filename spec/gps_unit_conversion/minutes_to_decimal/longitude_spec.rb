require 'spec_helper'

RSpec.describe GpsUnitConversion::MinutesToDecimal::Longitude do
  it 'converts longitude' do
    longitude_with_minutes = '02034.4097'

    expect(described_class.new(longitude: longitude_with_minutes).convert).to eq 20.578047
  end

  it 'more examples' do
    longitude_with_minutes = '0120050.8824'
    expect(described_class.new(longitude: longitude_with_minutes).convert).to eq 12.014134
    
    longitude_with_minutes = '0695959.5959'
    expect(described_class.new(longitude: longitude_with_minutes).convert).to eq 69.999888
   
    longitude_with_minutes = '1125612.3972'
    expect(described_class.new(longitude: longitude_with_minutes).convert).to eq 112.936777
  end

  it 'converts on western hemisphere' do
    longitude_with_minutes = '02034.4097'

    expect(described_class.new(longitude: longitude_with_minutes, direction: 'W').convert).to eq -20.578047
  end
end
