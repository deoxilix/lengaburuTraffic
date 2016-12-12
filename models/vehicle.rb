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

=begin

  :update_speed

    This behaviour is responsible for updating the speed of the Vehicle
    in anticipation with an Orbit's realtime traffic,
    for better estimation of ETA

  params:
    orbit: The Orbit, it should update it's speed for.

=end
  def update_speed (orbit)
    self.top_speed > orbit.traffic_speed ? orbit.traffic_speed : self.top_speed
  end

=begin

  :estimate_trip_time

    This is responsible for the deduction of travel time expected on a provided Orbit.

  params:
    orbit: The Orbit, it should estimate travel time for.

=end
  def estimate_trip_time (orbit)
    ( orbit.distance / self.update_speed(orbit).to_f + crater_delay(orbit) ).round 2
  end

=begin

  :crater_delay

    This is responsible for deduction of delay expected due to craters on a provided Orbit.

  params:
    orbit: The Orbit, it should deduce the crater_delay for

=end
  def crater_delay (orbit)
    self.crater_time * orbit.craters
  end
end
