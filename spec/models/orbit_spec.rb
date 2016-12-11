require 'spec_helper'

describe Orbit do
  before :each do
    @orbit1 = Orbit.new "orbit1", 8, 10
    @orbit2 = Orbit.new "orbit2", 12, 5

    @sunny_weather = Weather.new("Sunny", 0.9)
    @windy_weather = Weather.new("Windy", 1.0)
    @rainy_weather = Weather.new("Rainy", 1.1)
  end

  it "There should be a valid instance of Orbit" do
    expect(@orbit1).to be_an_instance_of Orbit
  end

  it "orbit knows its name" do
    expect(@orbit1.name).to eq "orbit1"
  end

  it "orbit knows its distance" do
    expect(@orbit1.distance).to eq 8
  end

  it "orbit knows the number of craters in it" do
    expect(@orbit1.craters).to eq 10
  end

  # it "orbit can update its traffic speed" do
  #   expect{@orbit1.update_traffic_speed 12 }.to change from(nil).to(12)
  # end

  it "orbit know its current traffic speed" do
    @orbit1.traffic_speed = 12
    expect(@orbit1.traffic_speed).to eq 12
  end

  it "number of craters in orbit varies with variying weather" do

    expect{@orbit1.weathering(@sunny_weather)}.to change {@orbit1.craters}.from(10).to(9)
    expect{@orbit2.weathering(@rainy_weather)}.to change {@orbit2.craters}.from(5).to(5.5)
  end
end
