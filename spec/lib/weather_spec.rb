require 'spec_helper'

describe Weather do
  before :each do
    @sunny = Weather.new "sunny", 0.9
    @rainy = Weather.new "rainy", 1.1
    @windy = Weather.new "windy", 1
  end

  it "There should be a valid instance of Weather," do
    expect(@sunny).to be_an_instance_of Weather
  end

  it "weather know its name" do
    expect(@sunny.name).to eq "sunny"
  end

  it "weather knows its crater_mod_index" do
    expect(@sunny.crater_mod_index).to eq 0.9
  end
end
