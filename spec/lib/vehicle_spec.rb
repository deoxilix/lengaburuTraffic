require 'spec_helper'

describe Vehicle do
  before :each do
    @sunny = Weather.new "sunny", 0.9
    @rainy = Weather.new "rainy", 1.1
    @windy = Weather.new "windy", 1.0

    @bike = Vehicle.new "bike", 10, 2, [@sunny, @windy]
    @tuktuk = Vehicle.new "tuktuk", 12, 1, [@sunny, @rainy]
    @superCar = Vehicle.new "superCar", 20, 3, [@sunny, @windy, @rainy]
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

  it "vehicle knows its modified speed, to match the traffic_speed of a given orbit" do
    @orbit1 = Orbit.new "orbit1", 10, 8
    @orbit1.traffic_speed = 8
    @orbit2 = Orbit.new "orbit2", 14, 10
    @orbit2.traffic_speed = 14

    expect{@bike.modify_speed @orbit1}.to eq 8
    expect{@tuktuk.modify_speed @orbit2}.to eq 12
    expect{@superCar.modify_speed @orbit1}.to eq 8
  end

  it "Vehicle knows which weather its viable in" do
    @bike.viable_weather << @sunny << @windy
    @tuktuk.viable_weather << @sunny << @rainy
    @superCar.viable_weather << @sunny << @windy << @rainy

    expect(@bike.viable_weather).to include @sunny, @windy
    expect(@tuktuk.viable_weather).to include @sunny, @rainy
    expect(@superCar.viable_weather).to include @sunny, @windy, @rainy
  end

  # it "vehicle can record estimate_time for an anticipated trip" do
  #   expect{@bike.time}.to be_an_instance_of Hash
  #   expect{@bike.time}.to be_empty
  # end

  # it "vehicle can deduce, time required to make a trip, on a given orbit in a particular weather condition" do
  #   @orbit1 = Orbit.new 10 8
  #   @orbit1.traffic_speed = 8
  #   @orbit1.weathering(@sunny)
  #   expect{@bike.estimate_time(@orbit1)}.to change {@bike.trip_time}
  # end
end
