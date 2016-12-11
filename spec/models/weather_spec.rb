require 'spec_helper'

describe Weather do
  it "There should be a valid instance of Weather," do
    expect(Weather::Types::SUNNY).to be_an_instance_of Weather
    expect(Weather::Types::WINDY).to be_an_instance_of Weather
    expect(Weather::Types::RAINY).to be_an_instance_of Weather
  end

  it "weather know its name" do
    expect(Weather::Types::SUNNY.name).to eq "Sunny"
    expect(Weather::Types::WINDY.name).to eq "Windy"
    expect(Weather::Types::RAINY.name).to eq "Rainy"
  end

  it "weather knows its crater_mod_index" do
    expect(Weather::Types::SUNNY.crater_mod_index).to eq 0.9
    expect(Weather::Types::WINDY.crater_mod_index).to eq 1
    expect(Weather::Types::RAINY.crater_mod_index).to eq 1.1
  end
end
