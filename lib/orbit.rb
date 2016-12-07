class Orbit
  attr_accessor :name, :distance, :craters, :traffic_speed
  Orbit_meta = [["Orbit1", 8, 10], ["Orbit2", 12, 5]]

  def initialize(name, distance, craters)
    @name = name
    @distance = distance
    @craters = craters
  end

  def weathering(weather)
    self.craters *= weather.crater_mod_index
  end

  def self.create
    Orbit_meta.each do |meta|
      LengaburuMaps::Available_orbits << new(*meta)
    end
  end
end

Orbit.create
