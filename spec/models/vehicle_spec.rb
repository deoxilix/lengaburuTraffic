require 'spec_helper'

describe Vehicle do
  before :each do
    @sunny_weather = Weather.new("Sunny", 0.9)
    @windy_weather = Weather.new("Windy", 1.0)
    @rainy_weather = Weather.new("Rainy", 1.1)


    @bike = Vehicle.new "bike", 10, 2, [@sunny_weather, @windy_weather]
    @tuktuk = Vehicle.new "tuktuk", 12, 1, [@sunny_weather, @windy_weather]
    @superCar = Vehicle.new "superCar", 20, 3, [@sunny_weather, @windy_weather, @rainy_weather]
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

  it "Vehicle knows its top_speed" do
    expect(@bike.top_speed).to eq 10
    expect(@tuktuk.top_speed).to eq 12
    expect(@superCar.top_speed).to eq 20
  end

  it "Vehicle knows which weather it is viable in" do
    expect(@bike.viable_weathers).to include @sunny_weather, @windy_weather
    expect(@tuktuk.viable_weathers).to include @sunny_weather, @windy_weather
    expect(@superCar.viable_weathers).to include @sunny_weather, @windy_weather, @rainy_weather
  end

  it "Vehicle knows its modified speed, to match the traffic_speed of a given orbit" do
    @orbit1 = Orbit.new "orbit1", 10, 8
    @orbit1.traffic_speed = 8
    @orbit2 = Orbit.new "orbit2", 14, 10
    @orbit2.traffic_speed = 14

    expect(@bike.update_speed @orbit1).to eq 8
    expect(@tuktuk.update_speed @orbit2).to eq 12
    expect(@superCar.update_speed @orbit1).to eq 8
  end

  it "Vehicle can estimate_trip_time on a given Orbit" do
    @orbit1 = Orbit.new "orbit1", 18, 20
    @orbit1.traffic_speed = 12
    @orbit1.weathering @sunny_weather

    @orbit2 = Orbit.new "orbit2", 20, 10
    @orbit2.traffic_speed = 10
    @orbit2.weathering @windy_weather

    expect(@bike.estimate_trip_time @orbit1).to eq 2.4
    expect(@tuktuk.estimate_trip_time @orbit2).to eq 2.17
  end
end
