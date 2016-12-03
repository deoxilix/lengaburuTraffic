class Orbit
  attr_accessor :name, :distance, :craters, :traffic_speed
  def initialize(name, distance, craters)
    @name = name
    @distance = distance
    @craters = craters
  end
end
