class Vehicle
  attr_accessor :name, :top_speed, :crater_time, :viable_weather
  def initialize( name, top_speed, crater_time )
    @name = name
    @top_speed = top_speed
    @crater_time = crater_time
    @viable_weather = []
  end
end
