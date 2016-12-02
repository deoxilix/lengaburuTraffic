require 'spec_helper'

describe Vehicle do
  before :each do
    @bike = Vehicle.new "bike", 10
    @tuktuk = Vehicle.new "tuktuk", 12
    @superCar = Vehicle.new "superCar", 20
    @sunny = Weather.new "sunny", 0.9
    @rainy = Weather.new "rainy", 1.1
    @windy = Weather.new "windy", 1.0
  end

  it "There is a valid instance of Vehicle" do
    expect(@bike).to be_an_instance_of Vehicle
    expect(@tuktuk).to be_an_instance_of Vehicle
    expect(@superCar).to be_an_instance_of Vehicle
  end

  it "Vehicle knows its name" do
    expect(@bike.name).to eq "bike"
    expect(@tuktuk.name).to eq "tuktuk"
    expect(@superCar.name).to eq "superCar"
  end

  it "Vehicle has a top_speed" do
    expect(@bike.top_speed).to eq 10
    expect(@tuktuk.top_speed).to eq 12
    expect(@superCar.top_speed).to eq 20
  end

  it "Vehicle knows which weather its viable in" do
    @bike.viable_weather << @sunny << @windy
    @tuktuk.viable_weather << @sunny << @rainy
    @car.viable_weather << @sunny << @windy << @rainy
    expect(@bike.viable_weather).to include @sunny, @windy
    expect(@tuktuk.viable_weather).to include @sunny, @rainy
    expect(@bike.viable_weather).to include @sunny, @windy, @rainy
  end
end
