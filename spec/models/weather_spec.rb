require 'spec_helper'

describe Weather do
  before :each do
    @sunny_weather = Weather.new("Sunny", 0.9)
    @windy_weather = Weather.new("Windy", 1.0)
    @rainy_weather = Weather.new("Rainy", 1.1)
  end

  it "There should be a valid instance of Weather," do
    expect(@sunny_weather).to be_an_instance_of Weather
    expect(@windy_weather).to be_an_instance_of Weather
    expect(@rainy_weather).to be_an_instance_of Weather
  end

  it "weather know its name" do
    expect(@sunny_weather.name).to eq "Sunny"
    expect(@windy_weather.name).to eq "Windy"
    expect(@rainy_weather.name).to eq "Rainy"
  end

  it "weather knows its crater_mod_index" do
    expect(@sunny_weather.crater_mod_index).to eq 0.9
    expect(@windy_weather.crater_mod_index).to eq 1
    expect(@rainy_weather.crater_mod_index).to eq 1.1
  end
end
