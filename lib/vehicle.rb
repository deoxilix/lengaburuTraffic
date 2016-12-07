require_relative "weather"
require_relative "../core/lengaburu_maps"

class Vehicle
  include LengaburuMaps
  attr_accessor :name, :top_speed, :crater_time, :viable_weathers
  Vehicle_meta = [["bike", 10, 2, [SUNNY, WINDY]], ["tuktuk", 12, 1, [SUNNY, RAINY]], ["superCar", 20, 3, [SUNNY, WINDY, RAINY]]]

  def initialize( name, top_speed, crater_time, viable_weathers )
    @name = name
    @top_speed = top_speed
    @crater_time = crater_time
    @viable_weathers = viable_weathers
  end

  def modify_speed(orbit)
    self.top_speed > orbit.traffic_speed ? orbit.traffic_speed : self.top_speed
  end

  def self.create
    LengaburuMaps::Available_vehicles.clear
    Vehicle_meta.each do |meta|
      LengaburuMaps::Available_vehicles << new(*meta)
    end
    LengaburuMaps::Available_vehicles
  end
end
