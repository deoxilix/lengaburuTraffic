class Vehicle
  attr_accessor :name, :top_speed, :crater_time, :viable_weather
  def initialize( name, top_speed, crater_time )
    @name = name
    @top_speed = top_speed
    @crater_time = crater_time
    @viable_weather = []
  end

  def modify_speed(orbit)
    self.top_speed = self.top_speed > orbit.traffic_speed ? orbit.traffic_speed : self.top_speed
  end
end
