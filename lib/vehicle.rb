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

  def update_speed (orbit)
    self.top_speed > orbit.traffic_speed ? orbit.traffic_speed : self.top_speed
  end

  def estimate_trip_time (orbit)
    ( orbit.distance / self.update_speed(orbit).to_f + crater_delay(orbit) ).round(2)
  end

  def crater_delay (orbit)
    self.crater_time * orbit.craters
  end
end
