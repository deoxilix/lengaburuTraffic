class Orbit
  attr_accessor :name, :distance, :craters, :traffic_speed

  def initialize(name, distance, craters)
    @name = name
    @distance = distance
    @craters = craters
  end

  def weathering(weather)
    self.craters *= weather.crater_mod_index
  end

  def update_traffic_speed (orbit_meta)
    self.traffic_speed = orbit_meta
  end
end
