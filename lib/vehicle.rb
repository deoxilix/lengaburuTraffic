%w{
  weather
}.each{|klass| require_relative klass }

class Vehicle
  attr_accessor :name, :top_speed, :crater_time, :viable_weathers

  def initialize( name, top_speed, crater_time, viable_weathers )
    @name = name
    @top_speed = top_speed
    @crater_time = crater_time / 60.0
    @viable_weathers = viable_weathers
  end

  def modify_speed(orbit)
    self.top_speed > orbit.traffic_speed ? orbit.traffic_speed : self.top_speed
  end
end
