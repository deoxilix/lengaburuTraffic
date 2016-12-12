class Orbit
  attr_accessor :name, :distance, :craters, :traffic_speed

  def initialize(name, distance, craters)
    @name = name
    @distance = distance
    @craters = craters
  end



=begin

  :weathering

    This behaviour is responsible for updating the number of :craters in the orbit

    due to :weathering in Lengaburu's :current_weather

    for better estimation of a Vehicle's :crater_delay on the Orbit

  params:
    current_weather: The Weather, it should update it's number of :craters for.

=end
  def weathering(current_weather)
    self.craters *= current_weather.crater_mod_index
  end



=begin

  :update_traffic_speed

    This behaviour is responsible for updating the :traffic_speed of the orbit

    from realtime traffic data provided by :LengaburuTrafficController, via :LengaburuMaps

  params:
    orbit_traffic_meta: The realtime data, it should update it's :traffic_speed with.

=end
  def update_traffic_speed (orbit_traffic_meta)
    self.traffic_speed = orbit_traffic_meta
  end
end
